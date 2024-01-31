import 'package:find_sport_task/view/constants/images.dart';
import 'package:find_sport_task/view/constants/language.dart';
import 'package:find_sport_task/view/screens/auth_screen.dart';
import 'package:find_sport_task/view/utils/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const name = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> languages = [
    'O\'zbek',
    'Узбек крилл',
    'Русский язык',
  ];
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 3.5),
            Container(
              margin: const EdgeInsets.fromLTRB(56.5, 0, 55.5, 271.5),
              padding: const EdgeInsets.fromLTRB(6, 6, 0, 6),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 18, 0),
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      AppImages.logo,
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Text(
                    'FindSport',
                    style: GoogleFonts.k2d(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                      letterSpacing: 0.8640000343,
                      color: const Color(0xff01001f),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(53, 0, 53, 0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: Text(
                            'Languages',
                            style: GoogleFonts.mulish(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.2000000477,
                              color: const Color(0xff232638),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffe7ecf3),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              selectedLanguage == null
                                  ? Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                      width: 32,
                                      height: 20,
                                      color: Colors.red,
                                      child: Image.asset(
                                        AppImages.uz,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container(),
                              const SizedBox(width: 15),
                              DropdownButton(
                                elevation: 0,
                                // isExpanded: true,
                                underline: Container(),
                                menuMaxHeight: 170,
                                hint: Padding(
                                  padding: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width -
                                          340),
                                  child: Text(
                                    'Choose a language',
                                    style: GoogleFonts.mulish(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5714285714,
                                      color: const Color(0xff949ca9),
                                    ),
                                  ),
                                ),
                                value: selectedLanguage,
                                icon:
                                    const Icon(Icons.keyboard_arrow_down_sharp),
                                iconSize: 25,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedLanguage = newValue!;
                                    if (selectedLanguage == 'O\'zbek') {
                                      LanguageType = LANGUAGE.UZ;
                                    } else if (selectedLanguage ==
                                        'Узбек крилл') {
                                      LanguageType = LANGUAGE.KIRILL;
                                    } else if (selectedLanguage ==
                                        'Русский язык') {
                                      LanguageType = LANGUAGE.RU;
                                    } else {
                                      LanguageType = LANGUAGE.NULL;
                                    }
                                  });
                                },
                                items: languages.map((card) {
                                  return DropdownMenuItem(
                                    value: card,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 8, 0),
                                          width: 32,
                                          height: 20,
                                          child: Image.asset(
                                            card == 'Русский язык'
                                                ? AppImages.ru
                                                : AppImages.uz,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(card),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (LanguageType != LANGUAGE.NULL) {
                        Navigator.pushNamed(context, AuthScreen.name);
                      } else {
                        ShowDialog.showLanguageDialog(context);
                      }
                    },
                    child: SizedBox(
                      width: 52,
                      height: 58,
                      child: Image.asset(
                        AppImages.continues,
                        width: 52,
                        height: 58,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
