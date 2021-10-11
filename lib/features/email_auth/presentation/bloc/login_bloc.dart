import 'dart:async';
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
  final FirebaseAuth _firebaseAuth;
  LoginBloc({
    required AuthLoginUseCase authLoginUseCase,
    required AuthGoogleSigInUseCase authGoogleSigInUseCase,
    required AuthFacebookSigInUseCase authFacebookSigInUseCase,
    required FirebaseAuth firebaseAuth,
  }) : _authLoginUseCase = authLoginUseCase,
     _authGoogleSigInUseCase = authGoogleSigInUseCase,
     _authFacebookSigInUseCase = authFacebookSigInUseCase,
     _firebaseAuth = firebaseAuth,
     super(LoginInitial()) {
    print('Login bloc');
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is NormalLoginEvent) {
      yield LoginLoading();
      final failureOrUser = await _authLoginUseCase(Params(email: event.email, password: event.password));
      yield* _eitherFailureOrLoaded(failureOrUser);
    } else if(event is GoogleSigInEvent) {
      yield LoginLoading();
      final failureOrUser  = await _authFacebookSigInUseCase(NoParams());
      yield* _eitherFailureOrLoaded(failureOrUser);
    } else if(event is FacebookSigInEvent) {
      yield LoginLoading();
      final failureOrUser  = await _authGoogleSigInUseCase(NoParams());
      yield* _eitherFailureOrLoaded(failureOrUser);
    }
  }

  Stream<LoginState> _eitherFailureOrLoaded(Either<Failure, UserModel> failureOrUser) async* {
    yield failureOrUser.fold(
            (e) => LoginFailure(_buildError(e)),
            (u) {
          if (u.user != null) return LoginSuccess(_buildUser(u));
          return LoginInitial();
        }
    );
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
