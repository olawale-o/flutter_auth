import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_auth/core/validators/email_validator.dart';
import 'package:flutter_auth/core/validators/password_validator.dart';
import 'package:formz/formz.dart';

part 'validation_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit() : super(ValidationState());


  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.email]),
    ));
  }
}