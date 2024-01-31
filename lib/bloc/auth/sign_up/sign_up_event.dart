part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

// ignore: must_be_immutable
class SignUpClick extends SignUpEvent {
  UserCreate user;

  SignUpClick(this.user);
}
