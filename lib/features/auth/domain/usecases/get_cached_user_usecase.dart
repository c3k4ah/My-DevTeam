import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../core/DTO/entities/user_enetity.dart';
import '../repositories/auth_repository.dart';

class GetCachedUserUseCase implements Usecase<UserEntity, NoParams> {
  final AuthRepository repository;

  GetCachedUserUseCase(
    this.repository,
  );

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return repository.getCachedUser();
  }
}
