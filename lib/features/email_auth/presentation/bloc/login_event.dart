part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  List<Object?> get props => [];
}

class NormalLoginEvent extends LoginEvent {
  final String email;
  final String password;

  NormalLoginEvent({ required this.email, required this.password });
}

class GoogleSigInEvent extends LoginEvent {}

class FacebookSigInEvent extends LoginEvent {}