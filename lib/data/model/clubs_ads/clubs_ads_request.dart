import 'package:json_annotation/json_annotation.dart';

part 'clubs_ads_request.g.dart';

@JsonSerializable()
class ClubsAdsRequest {
  String? title;
  String? description;
  double? lot;
  double? lat;

  ClubsAdsRequest({this.title, this.description, this.lot, this.lat});


  factory ClubsAdsRequest.fromJson(Map<String, dynamic> json) => _$ClubsAdsRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ClubsAdsRequestToJson(this);
}
