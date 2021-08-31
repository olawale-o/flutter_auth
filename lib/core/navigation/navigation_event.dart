part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent  extends Equatable {

  List<Object?> get props => [];
}


class NavigationPushName extends NavigationEvent {

  final String route;
  String? data;

  NavigationPushName({required this.route, this.data});
}

class NavigationPushReplace extends NavigationEvent {

  final String route;
  String? data;

  NavigationPushReplace({required this.route, this.data});
}

class NavigationPop extends NavigationEvent {}

class NavigationHome extends NavigationEvent {}
