import 'package:dartz/dartz.dart';
import '../../../../core/domain/usecase.dart';
import '../../../../core/exceptions/failure.dart';
import '../../data/model/user_model.dart';
import '../repository/auth_repository.dart';

class AuthLoginUseCase implements UseCase<UserModel, Params> {
  final AuthRepository authRepository;
  AuthLoginUseCase({ required this.authRepository });
  @override
  Future<Either<Failure, UserModel>> call(params) async {
    return await authRepository.login(params.email, params.password);
  }

}