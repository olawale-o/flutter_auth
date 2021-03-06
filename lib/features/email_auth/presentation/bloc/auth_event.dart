part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  List<Object?> get props => [];
}

class AppStartedEvent extends AuthEvent {}

class LoggedInEvent extends AuthEvent {}

class AuthCurrentUserEvent extends AuthEvent {}

class AuthenticatedEvent extends AuthEvent {
  final UserModel user;
  AuthenticatedEvent({required this.user});
}

class AuthLogoutEvent extends AuthEvent {}