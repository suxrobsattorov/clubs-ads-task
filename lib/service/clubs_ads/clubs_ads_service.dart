import 'package:dio/dio.dart';
import 'package:find_sport_task/data/model/clubs_ads/clubs_ads_request.dart';
import 'package:retrofit/retrofit.dart';

part 'clubs_ads_service.g.dart';

@RestApi(baseUrl: "https://qutb.uz/api")
abstract class ClubsAdsService {
  factory ClubsAdsService(Dio dio, {String baseUrl}) = _ClubsAdsService;

  @POST("/ads")
  Future<Response<Map<String, dynamic>>> createClub(
      @Body() ClubsAdsRequest request);
}
