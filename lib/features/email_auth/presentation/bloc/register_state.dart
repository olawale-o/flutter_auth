part of 'register_bloc.dart';

@immutable
abstract class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final UserModel userModel;
  const RegisterSuccess(this.userModel);
}

class RegisterFailure extends RegisterState {
  final String message;
  const RegisterFailure(this.message);
}
