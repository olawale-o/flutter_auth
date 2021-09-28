import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../domain/usecases/auth_current_user_usecase.dart';
import '../../domain/usecases/auth_logout_usecase.dart';
import '../../../../core/domain/usecase.dart';
import '../../../../core/exceptions/failure.dart';
import '../../data/model/user_model.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthLogoutUseCase _authLogoutUseCase;
  final AuthCurrentUserUseCase _authCurrentUserUseCase;

  AuthBloc({
    required AuthLogoutUseCase logoutUseCase,
    required AuthCurrentUserUseCase currentUserUseCase,
}) : _authLogoutUseCase = logoutUseCase,
    _authCurrentUserUseCase = currentUserUseCase,
        super(AuthInitial()) {
    print('Auth Bloc');
    add(AppStartedEvent());
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if(event is AuthLogoutEvent) {
      yield AuthLoading();
      yield AuthInitial();
      final failureOrVoid = await _authLogoutUseCase(NoParams());
      yield* _eitherFailureOrVoid(failureOrVoid);
    } else if (event is AuthCurrentUserEvent) {
      yield AuthLoading();
      final failureOrUser = await _authCurrentUserUseCase(NoParams());
      yield* _eitherFailureOrLoaded(failureOrUser);
    } else if (event is AppStartedEvent) {
      yield AuthLoading();
      final failureOrUser = await _authCurrentUserUseCase(NoParams());
      yield* _eitherFailureOrLoaded(failureOrUser);
    } else if (event is LoggedInEvent) {
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
    print("failure ${failure.message}");
    if (failure is NetworkFailure) return failure.message;
    if (failure is ServerFailure) return failure.message;
    if (failure is AuthFailure) return failure.message;
    return 'Uncaught error';
  }
}
