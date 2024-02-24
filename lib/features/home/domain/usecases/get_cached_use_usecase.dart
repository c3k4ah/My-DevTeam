import 'package:dartz/dartz.dart';

import 'package:mydevteam/core/error/failure.dart';

import '../../../../core/DTO/entities/user_enetity.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/repository.dart';

class GetHomeCachedUserUseCase extends Usecase<UserEntity, NoParams> {
  final HomeRepository repository;

  GetHomeCachedUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.getCachedUser();
  }
}
