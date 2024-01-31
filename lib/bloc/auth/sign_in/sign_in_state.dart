part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

// ignore: must_be_immutable
class SignInSuccess extends SignInState {
  SignInResponse? signInResponse;

  SignInSuccess(this.signInResponse);
}

class SignInError extends SignInState {}
