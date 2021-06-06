part of 'login_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignEmailWithPassEvent extends SignUpEvent {
  final String email;
  final String password;
  final String repeatPass;

  SignEmailWithPassEvent(
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
