
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/exceptions/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({required this.email, required this.password});

  List<Object?> get props => [email,];
}

class NoParams extends Equatable {
  NoParams();
  List<Object?> get props => [];
}