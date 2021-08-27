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
  final AuthSignUpUseCase authSignUpUseCase;
  final AuthLoginUseCase authLoginUseCase;
  final AuthLogoutUseCase authLogoutUseCase;
  final AuthCurrentUserUseCase authCurrentUserUseCase;
  final FirebaseAuth firebaseAuth;

  AuthBloc({
    required AuthSignUpUseCase signUpUseCase,
    required AuthLoginUseCase loginUseCase,
    required AuthLogoutUseCase logoutUseCase,
    required AuthCurrentUserUseCase currentUserUseCase,
    required this.firebaseAuth,
}) : authSignUpUseCase = signUpUseCase,
    authLoginUseCase = loginUseCase,
    authLogoutUseCase = logoutUseCase,
    authCurrentUserUseCase = currentUserUseCase,
        super(AuthInitial()) {
    print('Auth Bloc');
    add(AuthCurrentUserEvent());
    // firebaseAuth
    //     .authStateChanges()
    //     .listen((User? user) {
    //   if (user == null) {
    //     add(AuthLogoutEvent());
    //   } else {
    //     add(AuthenticatedEvent(user: user));
    //   }
    // });
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthSignUpEvent) {
      yield(AuthLoading());
      final failureOrUser = await authSignUpUseCase(Params(email: event.email, password: event.password));
      yield* _eitherFailureOrLoaded(failureOrUser);
    } else if (event is AuthLoginEvent) {
      yield AuthLoading();
      final failureOrUser = await authLoginUseCase(Params(email: event.email, password: event.password));
      yield* _eitherFailureOrLoaded(failureOrUser);
    } else if(event is AuthLogoutEvent) {
      yield AuthInitial();
      yield AuthLoading();
      final failureOrVoid = await authLogoutUseCase(NoParams());
      yield* _eitherFailureOrVoid(failureOrVoid);
    } else if (event is AuthCurrentUserEvent) {
      yield AuthLoading();
      final failureOrUser = await authCurrentUserUseCase(NoParams());
      yield* _eitherFailureOrLoaded(failureOrUser);
    }
  }

  Stream<AuthState> _eitherFailureOrLoaded(Either<Failure, UserModel> failureOrUser) async* {
    yield failureOrUser.fold((e) => AuthError(message: _buildError(e)), (u) => AuthLoaded(userModel: _buildUser(u)));
  }

  Stream<AuthState> _eitherFailureOrVoid(Either<Failure, void> failureOrVoid) async* {
    yield failureOrVoid.fold((e) => AuthError(message: _buildError(e)), (u) => AuthInitial());
  }

  UserModel _buildUser(UserModel authState) => authState;

  String _buildError(Failure failure) {
    if (failure is NetworkFailure) return 'Check your internet settings';
    if (failure is ServerFailure) return 'Unable to connect server';
    return 'Uncaught error';
  }
}
