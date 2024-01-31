import 'package:dio/dio.dart';
import 'package:find_sport_task/data/model/auth/user_create.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_up_service.g.dart';

@RestApi(baseUrl: "https://qutb.uz/api/auth")
abstract class SignUpService {
  factory SignUpService(Dio dio, {String baseUrl}) = _SignUpService;

  @POST("/register")
  Future<Response<Map<String, dynamic>>> createUser(@Body() UserCreate request);
}
