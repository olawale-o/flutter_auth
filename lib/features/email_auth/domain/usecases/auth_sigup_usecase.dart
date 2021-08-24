import 'package:dartz/dartz.dart';
import '../repository/auth_repository.dart';
import '../../../../core/exceptions/failure.dart';
import '../../data/model/user_model.dart';

import '../../../../core/domain/usecase.dart';

class AuthSignUpUseCase implements UseCase<UserModel, Params> {
  final AuthRepository authRepository;

  AuthSignUpUseCase({ required this.authRepository });
  @override
  Future<Either<Failure, UserModel>> call(params) async {
    return await authRepository.signUp(params.email, params.password);
  }

}