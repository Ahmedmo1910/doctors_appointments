import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_error_model.dart';

/// Every possible source of failure the app knows how to describe.
enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
}

/// HTTP status codes (positive) and local codes (negative).
abstract final class ResponseCode {
  // HTTP
  static const int success = 200;
  static const int noContent = 204;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int apiLogicError = 422;
  static const int internalServerError = 500;

  // Local (not coming from the server)
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

extension DataSourceX on DataSource {
  ApiErrorModel getFailure() => switch (this) {
        DataSource.noContent => ApiErrorModel(
            code: ResponseCode.noContent,
            message: ApiErrors.noContent,
          ),
        DataSource.badRequest => ApiErrorModel(
            code: ResponseCode.badRequest,
            message: ApiErrors.badRequestError,
          ),
        DataSource.forbidden => ApiErrorModel(
            code: ResponseCode.forbidden,
            message: ApiErrors.forbiddenError,
          ),
        DataSource.unauthorized => ApiErrorModel(
            code: ResponseCode.unauthorized,
            message: ApiErrors.unauthorizedError,
          ),
        DataSource.notFound => ApiErrorModel(
            code: ResponseCode.notFound,
            message: ApiErrors.notFoundError,
          ),
        DataSource.internalServerError => ApiErrorModel(
            code: ResponseCode.internalServerError,
            message: ApiErrors.internalServerError,
          ),
        DataSource.connectTimeout => ApiErrorModel(
            code: ResponseCode.connectTimeout,
            message: ApiErrors.timeoutError,
          ),
        DataSource.cancel => ApiErrorModel(
            code: ResponseCode.cancel,
            message: ApiErrors.defaultError,
          ),
        DataSource.receiveTimeout => ApiErrorModel(
            code: ResponseCode.receiveTimeout,
            message: ApiErrors.timeoutError,
          ),
        DataSource.sendTimeout => ApiErrorModel(
            code: ResponseCode.sendTimeout,
            message: ApiErrors.timeoutError,
          ),
        DataSource.cacheError => ApiErrorModel(
            code: ResponseCode.cacheError,
            message: ApiErrors.cacheError,
          ),
        DataSource.noInternetConnection => ApiErrorModel(
            code: ResponseCode.noInternetConnection,
            message: ApiErrors.noInternetError,
          ),
        DataSource.defaultError => ApiErrorModel(
            code: ResponseCode.defaultError,
            message: ApiErrors.defaultError,
          ),
      };
}

class ErrorHandler implements Exception {
  ErrorHandler.handle(Object? error)
      : apiErrorModel = error is DioException
            ? _mapDioException(error)
            : DataSource.defaultError.getFailure();

  final ApiErrorModel apiErrorModel;

  @override
  String toString() => 'ErrorHandler: $apiErrorModel';
}

ApiErrorModel _mapDioException(DioException error) {
  return switch (error.type) {
    DioExceptionType.connectionTimeout =>
      DataSource.connectTimeout.getFailure(),
    DioExceptionType.sendTimeout => DataSource.sendTimeout.getFailure(),
    DioExceptionType.receiveTimeout => DataSource.receiveTimeout.getFailure(),
    DioExceptionType.badResponse ||
    DioExceptionType.unknown =>
      _mapResponseError(error.response),
    DioExceptionType.cancel => DataSource.cancel.getFailure(),
    DioExceptionType.connectionError =>
      DataSource.noInternetConnection.getFailure(),
    DioExceptionType.badCertificate => DataSource.defaultError.getFailure(),
    DioExceptionType.transformTimeout => DataSource.defaultError.getFailure()
  };
}

/// Prefers the server's own error body; falls back to the status code.
ApiErrorModel _mapResponseError(Response<dynamic>? response) {
  final data = response?.data;
  if (data is Map<String, dynamic>) {
    return ApiErrorModel.fromJson(data);
  }

  return switch (response?.statusCode) {
    ResponseCode.badRequest => DataSource.badRequest.getFailure(),
    ResponseCode.unauthorized => DataSource.unauthorized.getFailure(),
    ResponseCode.forbidden => DataSource.forbidden.getFailure(),
    ResponseCode.notFound => DataSource.notFound.getFailure(),
    ResponseCode.internalServerError =>
      DataSource.internalServerError.getFailure(),
    _ => DataSource.defaultError.getFailure(),
  };
}

abstract final class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}