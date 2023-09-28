import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/project.entity.dart';
import '../repositories/project.domain.repo.dart';

class CreateProject extends Usecase<ProjectEntity, ProjectEntity> {
  final ProjectDomainRepo domainRepo;

  CreateProject({required this.domainRepo});
  @override
  Future<Either<Failure, ProjectEntity>> call(ProjectEntity params) {
    return domainRepo.createProject(project: params);
  }
}
