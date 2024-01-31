part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

// ignore: must_be_immutable
class SignInClick extends SignInEvent {
  String firstname;
  String password;

  SignInClick(this.firstname, this.password);
}
