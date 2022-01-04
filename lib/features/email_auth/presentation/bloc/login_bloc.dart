import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/domain/usecase.dart';
import '../../../../core/exceptions/failure.dart';
import '../../data/model/user_model.dart';
import '../../domain/usecases/auth_google_sign_usecase.dart';
import '../../domain/usecases/auth_login_usecase.dart';
import '../../domain/usecases/auth_facebook_login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthLoginUseCase _authLoginUseCase;
  final AuthGoogleSigInUseCase _authGoogleSigInUseCase;
  final AuthFacebookSigInUseCase _authFacebookSigInUseCase;
  LoginBloc({
    required AuthLoginUseCase authLoginUseCase,
    required AuthGoogleSigInUseCase authGoogleSigInUseCase,
    required AuthFacebookSigInUseCase authFacebookSigInUseCase,
    required FirebaseAuth firebaseAuth,
  }) : _authLoginUseCase = authLoginUseCase,
     _authGoogleSigInUseCase = authGoogleSigInUseCase,
     _authFacebookSigInUseCase = authFacebookSigInUseCase,
     super(LoginInitial()) {
    print('Login bloc');
    on<NormalLoginEvent>(_loginWithCredentials);

    on<GoogleSigInEvent>(_googleSignIn);

    on<FacebookSigInEvent>(_facebookSignIn);
  }

  void _loginWithCredentials(NormalLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final failureOrUser = await _authLoginUseCase(Params(email: event.args['email']!, password: event.args['password']!));
    emit(_failureOrUser(failureOrUser));
  }

  void _googleSignIn(GoogleSigInEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final failureOrUser = await _authGoogleSigInUseCase(NoParams());
    emit(_failureOrUser(failureOrUser));
  }

  void _facebookSignIn(FacebookSigInEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final failureOrUser = await _authFacebookSigInUseCase(NoParams());
    emit(_failureOrUser(failureOrUser));
  }


  _failureOrUser(Either<Failure, UserModel> failureOrUser) {
    return failureOrUser.fold(
            (e) => LoginFailure(_buildError(e)),
            (u) {
              if (u.isNotEmpty) return LoginSuccess(_buildUser(u));
              return LoginInitial();
            });
  }

  UserModel _buildUser(UserModel user) => user;

  String _buildError(Failure failure) {
    print("failure ${failure.message}");
    if (failure is NetworkFailure) return failure.message;
    if (failure is ServerFailure) return failure.message;
    if (failure is AuthFailure) return failure.message;
    return 'Uncaught error';
  }
}
