part of 'clubs_ads_bloc.dart';

@immutable
abstract class ClubsAdsEvent {}

// ignore: must_be_immutable
class ClubsAdsClick extends ClubsAdsEvent {
  ClubsAdsRequest request;

  ClubsAdsClick(this.request);
}
