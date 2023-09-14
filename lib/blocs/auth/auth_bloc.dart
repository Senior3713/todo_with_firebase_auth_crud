import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_with_firebase_auth/services/auth_service.dart';
import 'package:todo_with_firebase_auth/services/util_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(_signUp);
    on<SignInEvent>(_signIn);
  }

  void _signUp(SignUpEvent event, Emitter emit) async {
    if(!Util().validateRegistration(event)) {
      emit(const AuthFailure("Please check your data!"));
      return;
    }

    emit(AuthLoading());

    final result = await AuthService.signUp(event.email, event.password, event.username);
    if(result) {
      emit(SignUpSuccess());
    } else {
      emit(const AuthFailure("Something error, please try again later!!!"));
    }
  }

  void _signIn(SignInEvent event, Emitter emit) async {
    if(!Util().validateRegistrationSignIn(event)) {
      emit(const AuthFailure("Please check your data!"));
      return;
    }

    emit(AuthLoading());

    final result = await AuthService.signIn(event.email, event.password);
    if(result != null) {
      emit(SignInSuccess());
    } else {
      emit(const AuthFailure("Something error, please try again later!!!"));
    }
  }
}