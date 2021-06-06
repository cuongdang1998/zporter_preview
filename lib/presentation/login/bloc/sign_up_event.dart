part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpEmailWithPassEvent extends SignUpEvent {
  final String email;
  final String password;
  final String repeatPass;

  SignUpEmailWithPassEvent(
    this.email,
    this.password,
    this.repeatPass,
  );

  @override
  List<Object> get props => [
        email,
        password,
        repeatPass,
      ];
}

class SignInEmailWithPassEvent extends SignUpEvent {
  final String email;
  final String password;

  SignInEmailWithPassEvent(
    this.email,
    this.password,
  );

  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class CheckEmailVerificationEvent extends SignUpEvent {
  @override
  List<Object?> get props => [];
}
