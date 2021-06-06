import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:zporter_preview/domain/login/usecases/login_usecase.dart';
import 'package:zporter_preview/utils/di/injection.dart';

part 'login_event.dart';

part 'login_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final LoginUseCase loginUseCase;

  SignUpBloc(this.loginUseCase) : super(SignUpInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repeatController = TextEditingController();

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignEmailWithPassEvent) {
      yield* _mapSignUpEmailToState(event);
    }
  }

  Stream<SignUpState> _mapSignUpEmailToState(
      SignEmailWithPassEvent event) async* {
    print('here email: ${event.email} password: ${event.password}');
    if (validateEmail(event.email)) {
      try {
        final user = (await auth.createUserWithEmailAndPassword(
                email: event.email, password: event.password))
            .user;
        if (user != null) {
          print(
              'user token id: ${await user.getIdToken()}  tokenId result: ${await user.getIdTokenResult()} token: ${user.refreshToken}');
          user.sendEmailVerification();
        }
      } catch (ex) {
        print('ex ${ex}');
      }
    }
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool validatePassword(String pass) {
    return RegExp(
            r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
        .hasMatch(pass);

    /// r'^
    ///   (?=.*[A-Z])       // should contain at least one upper case
    ///   (?=.*[a-z])       // should contain at least one lower case
    ///   (?=.*?[0-9])      // should contain at least one digit
    ///   (?=.*?[!@#\$&*~]) // should contain at least one Special character
    ///    .{8,}             // Must be at least 8 characters in length
    /// $
  }
}
