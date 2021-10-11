import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/features/email_auth/presentation/bloc/register_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'features/email_auth/domain/usecases/auth_google_sign_usecase.dart';
import 'features/email_auth/data/datasource/auth_local_datasource.dart';
import 'features/email_auth/domain/usecases/auth_current_user_usecase.dart';
import 'features/email_auth/domain/usecases/auth_login_usecase.dart';
import 'features/email_auth/domain/usecases/auth_logout_usecase.dart';
import 'features/email_auth/domain/usecases/auth_sigup_usecase.dart';
import 'features/email_auth/presentation/bloc/auth_bloc.dart';
import 'features/email_auth/data/repository/auth_repository_impl.dart';
import 'features/email_auth/domain/repository/auth_repository.dart';
import 'features/email_auth/data/datasource/auth_remote_datasource.dart';
import 'package:get_it/get_it.dart';

import 'core/navigation/navigation_bloc.dart';
import 'features/email_auth/presentation/bloc/login_bloc.dart';

final s1 = GetIt.instance;

Future<void> init() async {
  // blocs
  s1.registerFactory(() => NavigationBloc(s1()));
  // Authbloc
  s1.registerFactory(() => AuthBloc(
      logoutUseCase: s1(),
      currentUserUseCase: s1(),
    )
  );

  //Loginbloc
  s1.registerFactory(() => LoginBloc(
      firebaseAuth: s1(),
      authGoogleSigInUseCase: s1(),
      authLoginUseCase: s1(),
    )
  );

  //Registerbloc
  s1.registerFactory(() => RegisterBloc(
      firebaseAuth: s1(),
    authRegisterUseCase: s1(),
    )
  );

  // repositiories
  s1.registerLazySingleton<AuthRepository>(() =>
      AuthRepositoryImpl(
        authRemoteDataSource: s1(),
        authLocalDataSource: s1(),
      ));

  // usecases
  s1.registerLazySingleton(() => AuthSignUpUseCase(authRepository: s1()));
  s1.registerLazySingleton(() => AuthLoginUseCase(authRepository: s1()));
  s1.registerLazySingleton(() => AuthLogoutUseCase(authRepository: s1()));
  s1.registerLazySingleton(() => AuthCurrentUserUseCase(authRepository: s1()));
  s1.registerLazySingleton(() => AuthGoogleSigInUseCase(authRepository: s1()));

  // datasources
  s1.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
      firebaseAuth: s1(),
      facebookAuth: s1(),
  ));
  s1.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(firebaseAuth: s1()));

  final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth facebookAuth = FacebookAuth.instance;
  s1.registerLazySingleton(() => navigatorKey);
  s1.registerLazySingleton(() => firebaseAuth);
  s1.registerLazySingleton(() => facebookAuth);

  print('initialized');
}
