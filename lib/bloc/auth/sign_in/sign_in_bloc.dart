import 'package:bloc/bloc.dart';
import 'package:find_sport_task/data/model/auth/sign_in_request.dart';
import 'package:find_sport_task/data/model/auth/sign_in_response.dart';
import 'package:find_sport_task/repository/auth/sign_in_repo.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SignInClick>((event, emit) async {
      emit(SignInLoading());
      try {
        SignInResponse? result = await SignInRepo().signIn(SignInRequest(
            firstname: event.firstname, password: event.password));
        if (result != null) {
          emit(SignInSuccess(result));
        } else {
          emit(SignInError());
        }
      } catch (e) {
        emit(SignInError());
      }
    });
  }
}
