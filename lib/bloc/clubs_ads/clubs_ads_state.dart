part of 'clubs_ads_bloc.dart';

@immutable
abstract class ClubsAdsState {}

class ClubsAdsInitial extends ClubsAdsState {}

class ClubsAdsLoading extends ClubsAdsState {}

// ignore: must_be_immutable
class ClubsAdsSuccess extends ClubsAdsState {
  ClubsAdsResponse clubsAdsResponse;

  ClubsAdsSuccess(this.clubsAdsResponse);
}

class ClubsAdsError extends ClubsAdsState {}
