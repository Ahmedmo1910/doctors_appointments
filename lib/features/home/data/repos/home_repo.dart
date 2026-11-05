import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/specialization_response_model.dart';
import '../../../../core/networking/api_error_handler.dart';

class HomeRepo {
  final ApiService _apiService;
  HomeRepo(this._apiService);

  Future<ApiResult<SpecializationResponseModel>> getSpecialization() async {
    try {
      final response = await _apiService.getSpecialization();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
