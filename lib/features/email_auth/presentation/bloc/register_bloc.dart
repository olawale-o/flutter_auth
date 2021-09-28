import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/domain/usecase.dart';
import '../../../../core/exceptions/failure.dart';
import '../../data/model/user_model.dart';
import '../../domain/usecases/auth_sigup_usecase.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthSignUpUseCase _authRegisterUseCase;
  final FirebaseAuth _firebaseAuth;
  RegisterBloc({
    required AuthSignUpUseCase authRegisterUseCase,
    required FirebaseAuth firebaseAuth,
}) : _authRegisterUseCase = authRegisterUseCase,
     _firebaseAuth = firebaseAuth,
     super(RegisterInitial()) {
    print("Register Bloc");
  }

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is NormalRegisterEvent) {
      yield RegisterLoading();
      final failureOrUser = await _authRegisterUseCase(Params(email: event.email, password: event.password));
      yield* _eitherFailureOrLoaded(failureOrUser);
    }
  }

  Stream<RegisterState> _eitherFailureOrLoaded(Either<Failure, UserModel> failureOrUser) async* {
    yield failureOrUser.fold(
            (e) => RegisterFailure(_buildError(e)),
            (u) {
          if (u.user != null) return RegisterSuccess(_buildUser(u));
          return RegisterInitial();
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
