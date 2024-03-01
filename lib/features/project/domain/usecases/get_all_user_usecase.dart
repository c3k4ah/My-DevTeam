import 'package:dartz/dartz.dart';

import '../../../../core/DTO/entities/user_enetity.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/project.domain.repo.dart';

class GetAllUsersUseCase implements Usecase<List<UserEntity>, NoParams> {
  final ProjectRepository domainRepo;

  GetAllUsersUseCase(this.domainRepo);

  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParams params) {
    return domainRepo.getAllUsers();
  }
}
