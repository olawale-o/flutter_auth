import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/exception.dart';
import '../../../../core/exceptions/failure.dart';
import '../datasource/auth_remote_datasource.dart';
import '../model/user_model.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({ required this.authRemoteDataSource });

  @override
  Future<Either<Failure, UserModel>> signUp(String email, String password) async {
    try {
      final user = await authRemoteDataSource.signUp(email, password);
      return Right(user);
    } on ServerException catch(e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch(e) {
      return Left(NetworkFailure(e.message));
    } on AuthException catch(e) {
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
    } on ServerException catch(e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch(e) {
      return Left(NetworkFailure(e.message));
    } on AuthException catch(e) {
      return Left(AuthFailure(e.message));
    } catch(e) {
      return Left(UncaughtFailure(e.toString()));
    }
  }

}