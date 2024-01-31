import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:find_sport_task/data/model/clubs_ads/clubs_ads_request.dart';
import 'package:find_sport_task/data/model/clubs_ads/clubs_ads_response.dart';
import 'package:find_sport_task/repository/clubs_ads/clubs_ads_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'clubs_ads_event.dart';

part 'clubs_ads_state.dart';

class ClubsAdsBloc extends Bloc<ClubsAdsEvent, ClubsAdsState> {
  ClubsAdsBloc() : super(ClubsAdsInitial()) {
    on<ClubsAdsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ClubsAdsClick>((event, emit)async {
      emit(ClubsAdsLoading());
      try {
        ClubsAdsResponse? result =await
            ClubsAdsRepo().create(event.request);
        if (result != null) {
          emit(ClubsAdsSuccess(result));
        } else {
          emit(ClubsAdsError());
        }
      } catch (e) {
        emit(ClubsAdsError());
      }
    });
  }
}
