part of 'login_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpSuccessState extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpErrorState extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpLoadingState extends SignUpState {
  @override
  List<Object> get props => [];
}
