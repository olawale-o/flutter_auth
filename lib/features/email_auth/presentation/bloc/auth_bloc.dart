import 'dart:async';
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
      final failureOrUser = await authSignUpUseCase(Params(email: event.email, password: event.password));
      yield* _eitherFailureOrLoaded(failureOrUser);
    } else if (event is AuthLoginEvent) {
      yield AuthLoading();
      final failureOrUser = await authLoginUseCase(Params(email: event.email, password: event.password));
      yield* _eitherFailureOrLoaded(failureOrUser);
    }
  }

  Stream<AuthState> _eitherFailureOrLoaded(Either<Failure, UserModel> failureOrUser) async* {
    yield failureOrUser.fold((e) => AuthError(message: _buildError(e)), (u) => AuthLoaded(userModel: _buildUser(u)));
  }

  UserModel _buildUser(UserModel authState) => authState;

  String _buildError(Failure failure) {
    if (failure is NetworkFailure) return 'Check your internet settings';
    if (failure is ServerFailure) return 'Unable to connect server';
    return 'Uncaught error';
  }
}
