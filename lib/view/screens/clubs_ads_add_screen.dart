import 'dart:async';

import 'package:find_sport_task/bloc/clubs_ads/clubs_ads_bloc.dart';
import 'package:find_sport_task/data/model/clubs_ads/clubs_ads_request.dart';
import 'package:find_sport_task/view/constants/images.dart';
import 'package:find_sport_task/view/constants/lat_long.dart';
import 'package:find_sport_task/view/widgets/text_form_field_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../data/model/yandex_map/app_lat_long.dart';
import '../../service/yandex/app_location_service.dart';
import '../constants/language.dart';
import '../constants/my_text_style.dart';
import '../utils/show_dialog.dart';

class ClubsAdsAddScreen extends StatefulWidget {
  const ClubsAdsAddScreen({super.key});

  static const name = '/clubs';

  @override
  State<ClubsAdsAddScreen> createState() => _ClubsAdsAddScreenState();
}

class _ClubsAdsAddScreenState extends State<ClubsAdsAddScreen> {
  final mapControllerCompleter = Completer<YandexMapController>();
  final GlobalKey<FormState> _formKey = GlobalKey();
  ClubsAdsRequest clubsAdsRequest = ClubsAdsRequest();
  bool newAddClubs = false;
  var errorMessage =
      '',
  appbar='',
  title='',
  titleHint='',
  titleValidate='',
  description='',
  descriptionHint='',
  descriptionValidate='',
  latLong='';

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // ignore: unnecessary_null_comparison
      if (clubsAdsRequest != null) {
        BlocProvider.of<ClubsAdsBloc>(context).add(
          ClubsAdsClick(clubsAdsRequest),
        );
      }
    }
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    AppLatLong location = const TashkentLocation();
    _moveToCurrentLocation(location);
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = TashkentLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    _moveToCurrentLocation(location);
  }

  Future<void> _moveToCurrentLocation(
    AppLatLong appLatLong,
  ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 13.5,
        ),
      ),
    );
  }

  @override
  void initState() {
    if (LanguageType == LANGUAGE.UZ) {
      errorMessage =
      'Kechirasiz xatolik sodir bo\'ldi. Qaytadan o\'rinib ko\'ring.';
    appbar='Yangi ads';
    title='Sarlavha';
    titleHint='Sarlavha kiriting';
    titleValidate='Iltimos, sarlavha kiriting.';
    description='Tavsif';
    descriptionHint='Tavsifni kiriting';
    descriptionValidate='Iltimos, tavsifni kiriting.';
    latLong='Xarita manzilini kiriting';
    } else if (LanguageType == LANGUAGE.KIRILL) {
      errorMessage = 'Кечирасиз хатолик содир булди. Кайтадан уриниб куринг.';
      appbar='Янги ads';
      title='Сарлавха';
      titleHint='Сарлавха киритинг';
      titleValidate='Илтимос, сарлавха киритинг.';
      description='Тавсиф';
      descriptionHint='Тавсиф киритинг';
      descriptionValidate='Илтимос, тавсиф киритинг.';
      latLong='Харита манзилини киритинг';
    } else if (LanguageType == LANGUAGE.RU) {
      errorMessage =
      'К сожалению, произошла ошибка. Пожалуйста, попробуйте еще раз.';
      appbar='Новые ads';
      title='Заголовок';
      titleHint='Введите название';
      titleValidate='Пожалуйста, введите название.';
      description='Описание';
      descriptionHint='Введите описание';
      descriptionValidate='Пожалуйста, введите описание.';
      latLong='Введите адрес карты';
    }
    super.initState();
    _initPermission().ignore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _fetchCurrentLocation();
          setState(() {});
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.data_saver_on),
      ),
      body: SafeArea(
        child: BlocConsumer<ClubsAdsBloc, ClubsAdsState>(
          builder: (context, state) {
            return showClubsAds(state);
          },
          listener: (context, state) {
            if (state is ClubsAdsSuccess) {
              ShowDialog.showClubsAdsDialog(clubsAdsRequest, context);
              clubsAdsRequest = ClubsAdsRequest();
              setState(() {});
            } else if (state is ClubsAdsError) {
              ShowDialog.showErrorDialog(errorMessage, context);
            }
          },
        ),
      ),
    );
  }

  Widget showClubsAds(ClubsAdsState state) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              child: state is ClubsAdsLoading
                  ? Container(
                      height: 535,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              appbar,
                              style: GoogleFonts.mulish(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                height: 1.2000000477,
                                color: const Color(0xff232638),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _submit();
                              },
                              child: Image.asset(
                                AppImages.save,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        TextFormFieldStyle(
                          title: title,
                          textFormField: TextFormField(
                            decoration: InputDecoration(
                              hintText: titleHint,
                              hintStyle: MyTextStyle.hintStyle(),
                              border: InputBorder.none,
                            ),
                            textInputAction: TextInputAction.next,
                            validator: (title) {
                              if (title == null || title.isEmpty) {
                                return titleValidate;
                              }
                              return null;
                            },
                            onSaved: (title) {
                              clubsAdsRequest.title = title!;
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextFormFieldStyle(
                          title: description,
                          textFormField: TextFormField(
                            decoration: InputDecoration(
                              hintText: descriptionHint,
                              hintStyle: MyTextStyle.hintStyle(),
                              border: InputBorder.none,
                            ),
                            maxLines: 6,
                            textInputAction: TextInputAction.done,
                            validator: (description) {
                              if (description == null || description.isEmpty) {
                                return descriptionValidate;
                              }
                              return null;
                            },
                            onSaved: (description) {
                              clubsAdsRequest.description = description!;
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0.6, 0, 0),
                              width: MediaQuery.of(context).size.width / 2 - 87.5,
                              height: 0.6,
                              decoration: const BoxDecoration(
                                color: Color(0xff01001f),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'Choose Location',
                              style: GoogleFonts.mulish(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                height: 1.255,
                                color: const Color(0xff01001f),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0.6, 0, 0),
                              width: MediaQuery.of(context).size.width / 2 - 87.5,
                              height: 0.6,
                              decoration: const BoxDecoration(
                                color: Color(0xff01001f),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: MyTextStyle.labelStyle(''),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(12, 12, 12, 12),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffe7ecf3),
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                LatLong == ''
                                    ? latLong
                                    : LatLong,
                                style: MyTextStyle.hintStyle(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 535,
            child: Stack(
              children: [
                YandexMap(
                  onMapCreated: (controller) {
                    mapControllerCompleter.complete(controller);
                  },
                  onCameraPositionChanged: (cameraPosition, reason, finished) {
                    if (finished) {
                      clubsAdsRequest.lat = cameraPosition.target.latitude;
                      clubsAdsRequest.lot = cameraPosition.target.longitude;
                      LatLong =
                          '${cameraPosition.target.latitude.toStringAsFixed(4)}  ${cameraPosition.target.longitude.toStringAsFixed(4)}';
                      setState(() {});
                    }
                  },
                ),
                const Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
