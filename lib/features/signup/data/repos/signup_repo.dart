import 'package:doctors_appointments/core/networking/api_service.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/signup_request_body.dart';
import '../models/signup_response_body.dart';

class SignupRepo {
  final ApiService _apiService;
  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponseBody>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _apiService.register(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
