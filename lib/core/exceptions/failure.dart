import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  List<Object?> get props => [message];
}

class AuthFailure extends Failure {
  final String message;
  AuthFailure(this.message) : super(message);
}

class UncaughtFailure extends Failure {
  final String message;
  UncaughtFailure(this.message) : super(message);
}