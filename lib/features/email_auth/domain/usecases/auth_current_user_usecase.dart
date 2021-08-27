import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';

import '../../data/model/user_model.dart';
import '../../../../core/domain/usecase.dart';
import '../repository/auth_repository.dart';

class AuthCurrentUserUseCase implements UseCase<UserModel, NoParams> {
  final AuthRepository authRepository;
  AuthCurrentUserUseCase({ required this.authRepository });
  @override
  Future<Either<Failure, UserModel>> call(NoParams noParams) async {
    return await authRepository.getCurrentUser();
  }

}