import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/navigation/navigation_bloc.dart';

final s1 = GetIt.instance;

Future<void> init() async {
  // blocs
  s1.registerFactory(() => NavigationBloc(s1()));
  
  final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();
  s1.registerLazySingleton(() => navigatorKey);

  print('initialized');
}
