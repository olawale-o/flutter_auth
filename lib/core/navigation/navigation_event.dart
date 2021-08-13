part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent  extends Equatable {

  List<Object?> get props => [];
}


class NavigationPushName extends NavigationEvent {

  final String route;

  NavigationPushName({required this.route,});
}

class NavigationPop extends NavigationEvent {}
