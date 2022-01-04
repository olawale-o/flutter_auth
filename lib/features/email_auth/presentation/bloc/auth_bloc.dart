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
    on<AuthLogoutEvent>(_onLogout);
    on<AppStartedEvent>(_onAppStarted);
    on<LoggedInEvent>(_onLoggedIn);

  }

  void _onLogout(AuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    emit(AuthInitial());
    final failureOrVoid = await _authLogoutUseCase(NoParams());
    emit(failureOrVoid.fold((e) => AuthError(message: _buildError(e)), (u) => AuthInitial()));
  }

  void _onAppStarted(AuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final failureOrUser = await _authCurrentUserUseCase(NoParams());
    emit(_failureOrUser(failureOrUser));
  }

  void _onLoggedIn(AuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final failureOrUser = await _authCurrentUserUseCase(NoParams());
    emit(_failureOrUser(failureOrUser));
  }

  _failureOrUser (Either<Failure, UserModel> failureOrUser) {
    return failureOrUser.fold(
      (e) => AuthError(message: _buildError(e)),
      (u) {
        if (u.isNotEmpty) return AuthLoaded(userModel: _buildUser(u));
        return AuthInitial();
      }
    );
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
