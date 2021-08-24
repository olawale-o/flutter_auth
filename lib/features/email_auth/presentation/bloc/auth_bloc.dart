import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_auth/core/domain/usecase.dart';
import 'package:flutter_auth/features/email_auth/data/model/user_model.dart';
import 'package:flutter_auth/features/email_auth/domain/usecases/auth_login_usecase.dart';
import 'package:flutter_auth/features/email_auth/domain/usecases/auth_sigup_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthSignUpUseCase authSignUpUseCase;
  final AuthLoginUseCase authLoginUseCase;

  AuthBloc({
    required AuthSignUpUseCase signUpUseCase,
    required AuthLoginUseCase loginUseCase,
}) : authSignUpUseCase = signUpUseCase,
    authLoginUseCase = loginUseCase,
        super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthSignUpEvent) {
      yield(AuthLoading());
      final user = await authSignUpUseCase(Params(email: event.email, password: event.password));
      yield user.fold((e) => AuthError(message: e.toString()), (u) => AuthLoaded(userModel: u));
    } else if (event is AuthLoginEvent) {
      yield AuthLoading();
      final user = await authLoginUseCase(Params(email: event.email, password: event.password));
      yield user.fold((e) => AuthError(message: e.toString()), (u) => AuthLoaded(userModel: u));
    }
  }
}
