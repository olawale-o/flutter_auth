import 'package:dartz/dartz.dart';
import '../../data/model/user_model.dart';
import '../../../../core/domain/usecase.dart';
import '../../../../core/exceptions/failure.dart';
import '../repository/auth_repository.dart';

class AuthGoogleSigInUseCase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;
  AuthGoogleSigInUseCase({ required this.authRepository });
  @override
  Future<Either<Failure, UserModel>> call(NoParams noParams) async {
    return await authRepository.signInWithGoogle();
  }

}
