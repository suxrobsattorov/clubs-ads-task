part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

// ignore: must_be_immutable
class SignUpSuccess extends SignUpState {
  SignUpResponse? signUpResponse;

  SignUpSuccess(this.signUpResponse);
}

class SignUpError extends SignUpState {}
