import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_sport_task/data/model/auth/sign_in_request.dart';
import 'package:find_sport_task/data/model/auth/sign_in_response.dart';

import '../../service/auth/sign_in_service.dart';

class SignInRepo {
  final dio = Dio();
  Future<SignInResponse?> signIn(SignInRequest request) async {
    final signInService = SignInService(dio);
    try {
      final response = await signInService.signIn(request);
      if (response.statusCode == 201) {
        return SignInResponse.fromJson(response.data as Map<String, dynamic>);
      }else{
        throw const HttpException('error');
      }
    } catch (error) {
      rethrow;
    }
  }
}
