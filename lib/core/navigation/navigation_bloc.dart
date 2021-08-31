import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_auth/core/routes/routes.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, dynamic> {
  final GlobalKey<NavigatorState> navKey;

  NavigationBloc(GlobalKey<NavigatorState> navigatorKey) : navKey = navigatorKey, super(0);

  @override
  Stream<NavigationState> mapEventToState(
      NavigationEvent event,
      ) async* {
    if(event is NavigationPop) {
      navKey.currentState!.pop();
    }
    else if(event is NavigationPushName) {
      navKey.currentState!.pushNamed(event.route, arguments: event.data);
    } else if(event is NavigationHome) {
      navKey.currentState!.pushNamedAndRemoveUntil(login_page, (route) => false);
    } else if (event is NavigationPushReplace) {
      navKey.currentState!.pushReplacementNamed(event.route, arguments: event.data);
    }
  }
}
