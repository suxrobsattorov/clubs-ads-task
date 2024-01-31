// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clubs_ads_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubsAdsRequest _$ClubsAdsRequestFromJson(Map<String, dynamic> json) =>
    ClubsAdsRequest(
      title: json['title'] as String?,
      description: json['description'] as String?,
      lot: (json['lot'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ClubsAdsRequestToJson(ClubsAdsRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'lot': instance.lot,
      'lat': instance.lat,
    };
