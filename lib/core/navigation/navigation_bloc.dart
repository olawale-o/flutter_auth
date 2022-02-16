import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_auth/core/routes/routes.dart';
import 'package:flutter/cupertino.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, dynamic> {
  final GlobalKey<NavigatorState> navKey;

  NavigationBloc(GlobalKey<NavigatorState> navigatorKey) : navKey = navigatorKey, super(0) {
    on<NavigationPushReplace>((event, emit) => navKey.currentState!.pushReplacementNamed(event.route, arguments: event.data) );
    on<NavigationPop>((event, emit) => navKey.currentState!.pop());
    on<NavigationPushName>((event, emit) => navKey.currentState!.pushNamed(event.route, arguments: event.data));
    on<NavigationHome>((event, emit) => navKey.currentState!.pushNamedAndRemoveUntil(login_page, (route) => false));
  }
}
