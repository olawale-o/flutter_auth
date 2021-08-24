import 'package:dartz/dartz.dart';
import 'package:flutter_auth/core/exceptions/failure.dart';
import 'package:flutter_auth/features/email_auth/data/datasource/auth_remote_datasource.dart';
import 'package:flutter_auth/features/email_auth/data/model/user_model.dart';
import 'package:flutter_auth/features/email_auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({ required this.authRemoteDataSource });

  @override
  Future<Either<Failure, UserModel>> signUp(String email, String password) async {
    try {
      final user = await authRemoteDataSource.signUp(email, password);
      return Right(user);
    } on AuthFailure catch(e) {
      return Left(AuthFailure(e.message));
    } catch(e) {
      return Left(UncaughtFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login(String email, String password) async {
    try {
      final user = await authRemoteDataSource.logIn(email, password);
      return Right(user);
    } on AuthFailure catch(e) {
      return Left(AuthFailure(e.message));
    } catch(e) {
      return left(UncaughtFailure(e.toString()));
    }
  }

}