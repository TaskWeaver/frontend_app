import 'package:dartz/dartz.dart';
import 'package:front/core/user/repositories/auth_repository.dart';
import 'package:front/core/utils/failure.dart';

class GetAuthenticatedUseCase {
  GetAuthenticatedUseCase({required this.authRepository});
  final AuthRepository authRepository;

  Future<Either<Failure, bool>> call() async {
    return await authRepository.getAuthenticated();
  }
}
