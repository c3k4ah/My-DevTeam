import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/project.entity.dart';
import '../repositories/project.domain.repo.dart';

class GetProjectByIdUseCase implements Usecase<ProjectEntity, String> {
  final ProjectRepository domainRepo;

  GetProjectByIdUseCase(this.domainRepo);

  @override
  Future<Either<Failure, ProjectEntity>> call(String params) {
    return domainRepo.getProjectById(id: params);
  }
}
