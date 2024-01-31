import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_sport_task/data/model/auth/sign_up_response.dart';

import '../../data/model/auth/user_create.dart';
import '../../service/auth/sign_up_service.dart';

class SignUpRepo {
  final dio = Dio();
  Future<SignUpResponse?> signUp(UserCreate user) async {
    final signUpService = SignUpService(dio);

    try {
      final response = await signUpService.createUser(user);
      if (response.statusCode == 201) {
        return SignUpResponse.fromJson(response.data as Map<String, dynamic>);
      }else{
        throw const HttpException('error');
      }
    } catch (error) {
      rethrow;
    }
  }
}
