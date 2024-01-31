import 'package:find_sport_task/view/utils/show_dialog.dart';
import 'package:find_sport_task/view/widgets/text_form_field_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/sign_up/sign_up_bloc.dart';
import '../../data/model/auth/user_create.dart';
import '../constants/language.dart';
import '../constants/my_text_style.dart';
import '../screens/clubs_ads_add_screen.dart';
import 'click_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  UserCreate userCreate = UserCreate();

  var errorMessage = '',
      firstname = '',
      firstnameHint = '',
      firstnameValidator = '',
      lastname = '',
      lastnameHint = '',
      lastnameValidator = '',
      phone = '',
      phoneValidator = '',
      password = '',
      passwordHint = '',
      passwordValidator = '',
      confirmPassword = '',
      confirmPasswordHint = '',
      confirmPasswordValidator = '',
      saveButton = '';

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // ignore: unnecessary_null_comparison
      if (userCreate != null) {
        BlocProvider.of<SignUpBloc>(context).add(
          SignUpClick(userCreate),
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
      lastname = 'Familiya';
      lastnameHint = 'Familiya kiriting';
      lastnameValidator = 'Iltimos, familiya kiriting.';
      phone = 'Telefon raqam';
      phoneValidator = 'Iltimos, telefon raqam kiriting.';
      password = 'Parol';
      passwordHint = 'Parol kiriting';
      passwordValidator = 'Iltimos, parol kiriting.';
      confirmPassword = 'Parol';
      confirmPasswordHint = 'Parolni tasdiqlang';
      confirmPasswordValidator = 'Parollar bir biriga mos kelmadi';
      saveButton = 'Saqlash';
    } else if (LanguageType == LANGUAGE.KIRILL) {
      errorMessage = 'Кечирасиз хатолик содир булди. Кайтадан уриниб куринг.';
      firstname = 'Исм';
      firstnameHint = 'Исм киритинг';
      firstnameValidator = 'Илтимос, исм киритинг.';
      lastname = 'Фамилия';
      lastnameHint = 'Фамилия киритинг';
      lastnameValidator = 'Илтимос, фамилия киритинг.';
      phone = 'Телефон номер';
      phoneValidator = 'Илтимос, телефон номер киритинг.';
      password = 'Парол';
      passwordHint = 'Парол киритинг';
      passwordValidator = 'Илтимос, парол киритинг.';
      confirmPassword = 'Парол';
      confirmPasswordHint = 'Паролни тасдикланг';
      confirmPasswordValidator = 'Пароллар бир бирига мос келмадию';
      saveButton = 'Саклаш';
    } else if (LanguageType == LANGUAGE.RU) {
      errorMessage =
      'К сожалению, произошла ошибка. Пожалуйста, попробуйте еще раз.';
      firstname = 'Имя';
      firstnameHint = 'Введите имя';
      firstnameValidator = 'Пожалуйста, введите имя.';
      lastname = 'Фамилия';
      lastnameHint = 'Введите фамилию';
      lastnameValidator = 'Пожалуйста, введите фамилию.';
      phone = 'Номер телефона';
      phoneValidator = 'Пожалуйста введите ваш номер телефона.';
      password = 'Пароль';
      passwordHint = 'Введите пароль';
      passwordValidator = 'Пожалуйста, введите пароль.';
      confirmPassword = 'Пароль';
      confirmPasswordHint = 'Подтвердите пароль';
      confirmPasswordValidator = 'Пароли не совпали';
      saveButton = 'Сохранять';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocConsumer<SignUpBloc, SignUpState>(
        builder: (context, state) {
          if (state is SignUpLoading) {
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
                    userCreate.firstname = firstname!;
                  },
                ),
              ),
              const SizedBox(height: 12),
              TextFormFieldStyle(
                title: lastname,
                textFormField: TextFormField(
                  decoration: InputDecoration(
                    hintText: lastnameHint,
                    hintStyle: MyTextStyle.hintStyle(),
                    border: InputBorder.none,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (lastname) {
                    if (lastname == null || lastname.isEmpty) {
                      return lastnameValidator;
                    }
                    return null;
                  },
                  onSaved: (lastname) {
                    userCreate.lastname = lastname!;
                  },
                ),
              ),
              const SizedBox(height: 12),
              TextFormFieldStyle(
                title: phone,
                textFormField: TextFormField(
                  decoration: InputDecoration(
                    hintText: '+998  (__) ___ - __ - __',
                    hintStyle: MyTextStyle.hintStyle(),
                    border: InputBorder.none,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (phone) {
                    if (phone == null || phone.isEmpty) {
                      return phoneValidator;
                    }
                    return null;
                  },
                  onSaved: (phone) {
                    userCreate.phone = '+998 ${phone!}';
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
                  controller: _passwordController,
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return passwordValidator;
                    }
                    return null;
                  },
                  onSaved: (password) {
                    userCreate.password = password!;
                  },
                ),
              ),
              const SizedBox(height: 12),
              TextFormFieldStyle(
                title: confirmPassword,
                textFormField: TextFormField(
                  decoration: InputDecoration(
                    hintText: confirmPasswordHint,
                    hintStyle: MyTextStyle.hintStyle(),
                    border: InputBorder.none,
                  ),
                  textInputAction: TextInputAction.done,
                  validator: (confirmedPassword) {
                    if (_passwordController.text != confirmedPassword) {
                      return confirmPasswordValidator;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 18),
              InkWell(
                onTap: () => _submit(),
                child: ClickButton(name: saveButton),
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state is SignUpSuccess) {
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushReplacementNamed(ClubsAdsAddScreen.name);
          } else if (state is SignUpError) {
            ShowDialog.showErrorDialog(errorMessage, context);
          }
        },
      ),
    );
  }
}
