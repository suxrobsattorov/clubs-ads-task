import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../data/model/auth/sign_up_response.dart';
import '../../../data/model/auth/user_create.dart';
import '../../../repository/auth/sign_up_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SignUpClick>((event, emit)async {
      emit(SignUpLoading());
      try {
        SignUpResponse? result =await SignUpRepo()
            .signUp(event.user);
        if (result != null) {
          emit(SignUpSuccess(result));
        } else {
          emit(SignUpError());
        }
      } catch (e) {
        emit(SignUpError());
      }
    });
  }
}
