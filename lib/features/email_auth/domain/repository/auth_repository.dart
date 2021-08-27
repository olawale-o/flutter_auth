import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../../data/model/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> signUp(String email, String password);
  Future<Either<Failure, UserModel>> login(String email, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserModel>> getCurrentUser();
}