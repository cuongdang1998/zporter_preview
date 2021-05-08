import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zporter_preview/data/login/models/request/login_request.dart';
import 'package:zporter_preview/data/login/models/response/login_response.dart';

part 'login_api.g.dart';

@RestApi()
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST('/login')
  Future<LoginResponse> login(@Body() LoginRequest request);
}
