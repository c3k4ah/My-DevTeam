import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/project.entity.dart';
import '../repositories/project.domain.repo.dart';

class GetProjectById implements Usecase<ProjectEntity, int> {
  final ProjectDomainRepo domainRepo;

  GetProjectById(this.domainRepo);

  @override
  Future<Either<Failure, ProjectEntity>> call(int params) {
    return domainRepo.getProjectById(id: params);
  }
}
