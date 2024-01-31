import 'package:dio/dio.dart';
import 'package:find_sport_task/data/model/auth/sign_in_request.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_in_service.g.dart';

@RestApi(baseUrl: "https://qutb.uz/api/auth")
abstract class SignInService {
  factory SignInService(Dio dio, {String baseUrl}) = _SignInService;

  @POST("/login")
  Future<Response<Map<String, dynamic>>> signIn(@Body() SignInRequest request);
}
