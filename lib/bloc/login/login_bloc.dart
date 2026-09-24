import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo_app/repository/login_repository.dart';
import 'package:equatable/equatable.dart';

part 'login_events.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates>{

  final LoginRepository _loginRepo = LoginRepository();
  
  LoginBloc() : super(const LoginStates()){

    on<LoginEventApi>((event, emit) async {
      emit(state.copyWith(
        loginStatus: LoginStatus.loading,
        message: 'Submitting.......'
      ));
      await _loginRepo.loginApi(email: state.email, password: state.password).then((value) {
        emit(state.copyWith(
          loginStatus: LoginStatus.success,
          message: 'Login Successful: $value'
        ));
      },).onError((error, stackTrace) {
        print("object: ${error.toString().replaceFirst('Exception: ', '')}");
        emit(state.copyWith(
            loginStatus: LoginStatus.error,
            message: error.toString().replaceFirst('Exception: ', ''),
        ));
      },);
    },);

    on<EmailButton>((EmailButton event, Emitter<LoginStates> emit) {
      emit(state.copyWith(
        email: event.email
      ));
    },);

    on<PasswordButton>((PasswordButton event, Emitter<LoginStates> emit) {
      emit(state.copyWith(
          password: event.password
      ));
    },);

  }
}