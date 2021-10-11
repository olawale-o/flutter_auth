import 'package:dartz/dartz.dart';
import '../../data/model/user_model.dart';
import '../../../../core/domain/usecase.dart';
import '../../../../core/exceptions/failure.dart';
import '../repository/auth_repository.dart';

class AuthFacebookSigInUseCase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;
  AuthFacebookSigInUseCase({ required this.authRepository });
  @override
  Future<Either<Failure, UserModel>> call(NoParams noParams) async {
    return await authRepository.signInWithFacebook();
  }

}
