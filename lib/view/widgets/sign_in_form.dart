import 'package:find_sport_task/view/constants/language.dart';
import 'package:find_sport_task/view/screens/clubs_ads_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/sign_in/sign_in_bloc.dart';
import '../constants/my_text_style.dart';
import '../utils/show_dialog.dart';
import 'click_button.dart';
import 'text_form_field_style.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _authData = {
    'firstname': '',
    'password': '',
  };
  var errorMessage = '',
      firstname = '',
      firstnameHint = '',
      firstnameValidator = '',
      password = '',
      passwordHint = '',
      passwordValidator = '',
      continueButton = '';

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_authData['firstname'] != null && _authData['password'] != null) {
        BlocProvider.of<SignInBloc>(context).add(
          SignInClick(_authData['firstname']!, _authData['password']!),
        );
      }
    }
  }

  @override
  void initState() {
    if (LanguageType == LANGUAGE.UZ) {
      errorMessage =
          'Kechirasiz xatolik sodir bo\'ldi. Qaytadan o\'rinib ko\'ring.';
      firstname = 'Ism';
      firstnameHint = 'Ism kiriting';
      firstnameValidator = 'Iltimos, ism kiriting.';
      password = 'Parol';
      passwordHint = 'Parol kiriting';
      passwordValidator = 'Iltimos, parol kiriting.';
      continueButton = 'Davom eting';
    } else if (LanguageType == LANGUAGE.KIRILL) {
      errorMessage = 'Кечирасиз хатолик содир булди. Кайтадан уриниб куринг.';
      firstname = 'Исм';
      firstnameHint = 'Исм киритинг';
      firstnameValidator = 'Илтимос, исм киритинг.';
      password = 'Парол';
      passwordHint = 'Парол киритинг';
      passwordValidator = 'Илтимос, парол киритинг.';
      continueButton = 'Давом етинг';
    } else if (LanguageType == LANGUAGE.RU) {
      errorMessage =
          'К сожалению, произошла ошибка. Пожалуйста, попробуйте еще раз.';
      firstname = 'Имя';
      firstnameHint = 'Введите имя';
      firstnameValidator = 'Пожалуйста, введите имя.';
      password = 'Пароль';
      passwordHint = 'Введите пароль';
      passwordValidator = 'Пожалуйста, введите пароль.';
      continueButton = 'Продолжать идти';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocConsumer<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state is SignInLoading) {
            return const CircularProgressIndicator();
          }
          return Column(
            children: [
              TextFormFieldStyle(
                title: firstname,
                textFormField: TextFormField(
                  decoration: InputDecoration(
                    hintText: firstnameHint,
                    hintStyle: MyTextStyle.hintStyle(),
                    border: InputBorder.none,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (firstname) {
                    if (firstname == null || firstname.isEmpty) {
                      return firstnameValidator;
                    }
                    return null;
                  },
                  onSaved: (firstname) {
                    _authData['firstname'] = firstname!;
                  },
                ),
              ),
              const SizedBox(height: 12),
              TextFormFieldStyle(
                title: password,
                textFormField: TextFormField(
                  decoration: InputDecoration(
                    hintText: passwordHint,
                    hintStyle: MyTextStyle.hintStyle(),
                    border: InputBorder.none,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return passwordValidator;
                    }
                    return null;
                  },
                  onSaved: (password) {
                    _authData['password'] = password!;
                  },
                ),
              ),
              const SizedBox(height: 18),
              InkWell(
                onTap: () => _submit(),
                child: ClickButton(name: continueButton),
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state is SignInSuccess) {
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushReplacementNamed(ClubsAdsAddScreen.name);
          } else if (state is SignInError) {
            ShowDialog.showErrorDialog(errorMessage, context);
          }
        },
      ),
    );
  }
}
