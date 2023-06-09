import 'dart:async';
import 'package:alex_messenger/app/authentication/domain/entities/account.dart';
import 'package:alex_messenger/app/authentication/domain/usecases/signup.dart';
import 'package:alex_messenger/app/authentication/domain/usecases/login.dart';
import 'package:alex_messenger/app/authentication/domain/usecases/get_account.dart';
import 'package:alex_messenger/app/authentication/presentation/screens/login_screen.dart';
import 'package:alex_messenger/app/home/presentation/screens/home_screen.dart';
import 'package:alex_messenger/core/services/app_router/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Signup signup;
  final Login login;
  final GetAccount getAccount;
  AuthenticationBloc({required this.signup, required this.login, required this.getAccount}) : super(AuthenticationInitial()) {
    on<AuthenticationEventSignup>(_onSignup);
    on<AuthenticationEventLogin>(_onLogin);
    on<AuthenticationEventReLogin>(_onReLogin);
  }

  FutureOr<void> _onSignup(AuthenticationEventSignup event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationStateLoading());
    Account account = event.account;
    var failure = await signup.call(account);
    if(failure == null) {
      emit(AuthenticationInitial());
      ScaffoldMessenger.of(AppRouter.navigatorKey.currentContext!).showSnackBar(
          const SnackBar(
            content: Text('Signup successful! Check your email to verify'),
            backgroundColor: Colors.green,
          )
      );
    } else {
      ScaffoldMessenger.of(AppRouter.navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(failure.message),
          backgroundColor: Colors.red,
        )
      );
      emit(AuthenticationStateSignUpFail(message: failure.message));
    }
  }

  FutureOr<void> _onLogin(AuthenticationEventLogin event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationStateLoading());
    Account account = event.account;
    var result = await login.call(account);
    result.fold(
      (failure) {
        ScaffoldMessenger.of(AppRouter.navigatorKey.currentContext!).showSnackBar(
            SnackBar(
              content: Text(failure.message),
              backgroundColor: Colors.red,
            )
        );
        emit(AuthenticationStateLoginFail(message: failure.message));
        AppRouter.pushReplacement(const LoginScreen());
      },
      (user) {
        emit(AuthenticationStateLoginSuccessful(user: user));
        AppRouter.pushReplacement(const HomeScreen());
      }
    );
  }


  FutureOr<void> _onReLogin(AuthenticationEventReLogin event, Emitter<AuthenticationState> emit) {
    var account = getAccount.call();
    if(account.email.isNotEmpty) {
      add(AuthenticationEventLogin(account: account));
    } else {
      AppRouter.pushReplacement(const LoginScreen());
    }
  }
}
