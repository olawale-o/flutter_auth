part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});

  List<Object?> get props => [message];
}

class AuthLoaded extends AuthState {
  final UserModel userModel;
  AuthLoaded({required this.userModel});
}

class UnAuthenticated extends AuthState {}