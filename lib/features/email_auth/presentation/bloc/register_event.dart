part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class NormalRegisterEvent extends RegisterEvent {
  final String email;
  final String password;

  NormalRegisterEvent({ required this.email, required this.password });
}
