import 'package:dartz/dartz.dart';
import '../../../../core/domain/usecase.dart';
import '../../../../core/exceptions/failure.dart';
import '../repository/auth_repository.dart';

class AuthLogoutUseCase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;
  AuthLogoutUseCase({ required this.authRepository });
  @override
  Future<Either<Failure, void>> call(NoParams noParams) async {
    return await authRepository.logout();
  }

}
