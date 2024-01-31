import 'package:find_sport_task/view/constants/images.dart';
import 'package:find_sport_task/view/widgets/sign_in_form.dart';
import 'package:find_sport_task/view/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/language.dart';

enum AuthType {
  // ignore: constant_identifier_names
  SIGN_IN,
  // ignore: constant_identifier_names
  SIGN_UP
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const name = '/auth';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthType authType = AuthType.SIGN_IN;
  var signIn = '', signUp = '';

  @override
  void initState() {
    if (LanguageType == LANGUAGE.UZ) {
      signIn = 'Kirish';
      signUp = 'Ro\'yhatdan o\'tish';
    } else if (LanguageType == LANGUAGE.KIRILL) {
      signIn = 'Кириш';
      signUp = 'Руйхатдан утиш';
    } else if (LanguageType == LANGUAGE.RU) {
      signIn = 'Входить';
      signUp = 'Зарегистрироваться';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4, right: 45, left: 45),
                  child: Image.asset(
                    AppImages.signup,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  authType == AuthType.SIGN_IN ? signIn : signUp,
                  style: GoogleFonts.mulish(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1.255,
                    letterSpacing: 1.2000000477,
                    color: const Color(0xff01001f),
                  ),
                ),
                const SizedBox(height: 20),
                authType == AuthType.SIGN_IN
                    ? const SignInForm()
                    : const SignUpForm(),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    authType == AuthType.SIGN_IN
                        ? authType = AuthType.SIGN_UP
                        : authType = AuthType.SIGN_IN;
                    setState(() {});
                  },
                  child: Text(
                    authType == AuthType.SIGN_UP ? signIn : signUp,
                    style: GoogleFonts.mulish(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
