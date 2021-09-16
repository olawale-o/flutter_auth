import 'package:dartz/dartz.dart';
import '../datasource/auth_local_datasource.dart';
import '../../../../core/exceptions/exception.dart';
import '../../../../core/exceptions/failure.dart';
import '../datasource/auth_remote_datasource.dart';
import '../model/user_model.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

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

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final result = await authRemoteDataSource.logout();
      return Right(result);
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
  Future<Either<Failure,UserModel>> getCurrentUser() async {
    try {
      final result = await authLocalDataSource.currentUser();
      return Right(result);
    } catch(e) {
      return Left(UncaughtFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithGoogle() async {
    try {
      final result = await authRemoteDataSource.signInWithGoogle();
      return Right(result);
    } on ServerException catch(e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch(e) {
      return Left(NetworkFailure(e.message));
    } catch(e) {
      return Left(UncaughtFailure(e.toString()));
    }
  }
}