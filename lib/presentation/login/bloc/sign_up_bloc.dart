import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:zporter_preview/domain/login/usecases/login_usecase.dart';
import 'package:zporter_preview/utils/di/injection.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

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
    if (event is SignUpEmailWithPassEvent) {
      yield* _mapSignUpEmailToState(event);
    }
    if (event is CheckEmailVerificationEvent) {
      yield* _mapCheckEmailVerificationToState();
    }
    if (event is SignInEmailWithPassEvent) {
      yield* _mapSignInEmailToState(event);
    }
  }

  Stream<SignUpState> _mapSignUpEmailToState(
      SignUpEmailWithPassEvent event) async* {
    yield SignUpLoadingState();
    if (validateEmail(event.email)) {
      try {
        final user = (await auth.createUserWithEmailAndPassword(
                email: event.email, password: event.password))
            .user;
        if (user != null) {
          print('uid: ${user.uid}\ntoken ${await user.getIdToken()}');
          user.sendEmailVerification();
          yield SignUpSuccessState();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Stream<SignUpState> _mapCheckEmailVerificationToState() async* {
    print('token : ${await auth.currentUser!.getIdToken()}');
  }

  Stream<SignUpState> _mapSignInEmailToState(
      SignInEmailWithPassEvent event) async* {
    final user = auth.currentUser;
    if (user != null) {
      await user.reload();
      if (!user.emailVerified) {
        print('Please verify your email');
      } else {
        if (validateEmail(event.email)) {
          try {
            UserCredential userCredential =
                await auth.signInWithEmailAndPassword(
              email: event.email,
              password: event.password,
            );
            print('Sign in ${await userCredential.user!.getIdToken()}');
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              print('No user found for hat email.');
            } else if (e.code == 'wrong-password') {
              print('Wrong password provided for that user.');
            }
          }
        }
      }
    } else {
      print("user null");
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
