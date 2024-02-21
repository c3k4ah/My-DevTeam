import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../core/DTO/entities/user_enetity.dart';
import '../domain.dart';
import '../entities/login_params.dart';

class LoginUserUseCase extends Usecase<UserEntity, LoginParams> {
  final AuthRepository domainRepo;

  LoginUserUseCase(this.domainRepo);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return domainRepo.loginUser(params);
  }
}

class StoreUserUseCase extends Usecase<bool, UserEntity> {
  final AuthRepository domainRepo;

  StoreUserUseCase({required this.domainRepo});

  @override
  Future<Either<Failure, bool>> call(UserEntity params) async {
    return domainRepo.cachedUser(params);
  }
}
