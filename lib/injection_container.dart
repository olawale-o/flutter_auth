import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

Future<void> init() async {

  final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();
  s1.registerLazySingleton(() => navigatorKey);

  print('initialized');
}
