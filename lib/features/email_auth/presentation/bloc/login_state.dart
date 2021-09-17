part of 'login_bloc.dart';

abstract class LoginState{
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserModel userModel;
  const LoginSuccess(this.userModel);
}

class LoginFailure extends LoginState {
  final String message;
  const LoginFailure(this.message);
}
