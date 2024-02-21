import 'package:dartz/dartz.dart';

import '../../../../../core/DTO/entities/user_enetity.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

class LoginWithDFacebookUseCase extends Usecase<UserEntity, NoParams> {
  final AuthRepository repository;

  LoginWithDFacebookUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) async {
    return await repository.loginWithFacebook();
  }
}
