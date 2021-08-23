import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'features/email_auth/data/datasource/auth_remote_datasource.dart';
import 'package:get_it/get_it.dart';

import 'core/navigation/navigation_bloc.dart';

final s1 = GetIt.instance;

Future<void> init() async {
  // blocs
  s1.registerFactory(() => NavigationBloc(s1()));

  s1.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(firebaseAuth: s1()));

  final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  s1.registerLazySingleton(() => navigatorKey);
  s1.registerLazySingleton(() => firebaseAuth);

  print('initialized');
}
