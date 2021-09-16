import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/features/email_auth/domain/usecases/auth_current_user_usecase.dart';
import 'package:flutter_auth/features/email_auth/domain/usecases/auth_logout_usecase.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/domain/usecase.dart';
import '../../../../core/exceptions/failure.dart';
import '../../data/model/user_model.dart';
import '../../domain/usecases/auth_login_usecase.dart';
import '../../domain/usecases/auth_sigup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthSignUpUseCase _authSignUpUseCase;
  final AuthLoginUseCase _authLoginUseCase;
  final AuthLogoutUseCase _authLogoutUseCase;
  final AuthCurrentUserUseCase _authCurrentUserUseCase;
  final FirebaseAuth _firebaseAuth;

  AuthBloc({
    required AuthSignUpUseCase signUpUseCase,
    required AuthLoginUseCase loginUseCase,
    required AuthLogoutUseCase logoutUseCase,
    required AuthCurrentUserUseCase currentUserUseCase,
    required FirebaseAuth firebaseAuth,
}) : _authSignUpUseCase = signUpUseCase,
    _authLoginUseCase = loginUseCase,
    _authLogoutUseCase = logoutUseCase,
    _authCurrentUserUseCase = currentUserUseCase,
    _firebaseAuth = firebaseAuth,
        super(AuthInitial()) {
    print('Auth Bloc');
    add(AuthCurrentUserEvent());
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthSignUpEvent) {
      yield(AuthLoading());
      final failureOrUser = await _authSignUpUseCase(Params(email: event.email, password: event.password));
      yield* _eitherFailureOrLoaded(failureOrUser);
    } else if (event is AuthLoginEvent) {
      yield AuthLoading();
      final failureOrUser = await _authLoginUseCase(Params(email: event.email, password: event.password));
      yield* _eitherFailureOrLoaded(failureOrUser);
    } else if(event is AuthLogoutEvent) {
      yield AuthLoading();
      yield AuthInitial();
      final failureOrVoid = await _authLogoutUseCase(NoParams());
      yield* _eitherFailureOrVoid(failureOrVoid);
    } else if (event is AuthCurrentUserEvent) {
      yield AuthLoading();
      final failureOrUser = await _authCurrentUserUseCase(NoParams());
      yield* _eitherFailureOrLoaded(failureOrUser);
    }
  }

  Stream<AuthState> _eitherFailureOrLoaded(Either<Failure, UserModel> failureOrUser) async* {
    yield failureOrUser.fold(
     (e) => AuthError(message: _buildError(e)),
     (u) {
     if (u.user != null) return AuthLoaded(userModel: _buildUser(u));
       return AuthInitial();
     }
    );
  }

  Stream<AuthState> _eitherFailureOrVoid(Either<Failure, void> failureOrVoid) async* {
    yield failureOrVoid.fold((e) => AuthError(message: _buildError(e)), (u) => AuthInitial());
  }

  UserModel _buildUser(UserModel authState) => authState;

  String _buildError(Failure failure) {
    if (failure is NetworkFailure) return failure.message;
    if (failure is ServerFailure) return failure.message;
    if (failure is AuthFailure) return failure.message;
    return 'Uncaught error';
  }
}
