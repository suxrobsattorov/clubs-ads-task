import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_sport_task/data/model/clubs_ads/clubs_ads_request.dart';
import 'package:find_sport_task/data/model/clubs_ads/clubs_ads_response.dart';

import '../../service/clubs_ads/clubs_ads_service.dart';

class ClubsAdsRepo {
  final dio = Dio();
  Future<ClubsAdsResponse?> create(ClubsAdsRequest request) async {
    final clubsAdsService = ClubsAdsService(dio);

    try {
      final response = await clubsAdsService.createClub(request);
      if (response.statusCode == 201) {
        return ClubsAdsResponse.fromJson(response.data as Map<String, dynamic>);
      }else{
        throw const HttpException('error');
      }
    } catch (error) {
      rethrow;
    }
  }
}
