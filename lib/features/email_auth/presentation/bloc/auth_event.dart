part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  List<Object?> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({ required this.email, required this.password });
}

class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignUpEvent({ required this.email, required this.password });
}

class AuthGoogleSigInEvent extends AuthEvent {}

class AuthCurrentUserEvent extends AuthEvent {}

class AuthenticatedEvent extends AuthEvent {
  final UserModel user;
  AuthenticatedEvent({required this.user});
}

class AuthLogoutEvent extends AuthEvent {}