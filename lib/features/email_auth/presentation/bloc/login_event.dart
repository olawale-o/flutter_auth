part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  List<Object?> get props => [];
}

class NormalLoginEvent extends LoginEvent {
  final Map<String, String> args;

  NormalLoginEvent({required this.args});

  List<Object?> get props => [args];
}

class GoogleSigInEvent extends LoginEvent {}

class FacebookSigInEvent extends LoginEvent {}