import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/login/data/models/login_request_body.dart';
import '../../features/login/data/models/login_response.dart';
import '../../features/signup/data/models/signup_request_body.dart';
import '../../features/signup/data/models/signup_response_body.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignupResponseBody> register(
    @Body() SignupRequestBody signupRequestBody,
  );
}
