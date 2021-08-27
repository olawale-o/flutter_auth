import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

final s1 = GetIt.instance;

Future<void> init() async {
  // blocs
  s1.registerFactory(() => NavigationBloc(s1()));
  s1.registerFactory(() => AuthBloc(
      signUpUseCase: s1(),
      loginUseCase: s1(),
      logoutUseCase: s1(),
     firebaseAuth: s1(),
     currentUserUseCase: s1(),
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

  // datasources
  s1.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(firebaseAuth: s1()));
  s1.registerLazySingleton(() => AuthLocalDataSourceImpl(firebaseAuth: s1()));

  final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  s1.registerLazySingleton(() => navigatorKey);
  s1.registerLazySingleton(() => firebaseAuth);

  print('initialized');
}
