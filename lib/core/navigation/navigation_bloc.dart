import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
      navKey.currentState!.pushNamed(event.route,);
    }
  }
}
