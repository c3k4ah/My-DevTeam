import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/project.entity.dart';
import '../repositories/project.domain.repo.dart';

class GetAllProjectsUseCase implements Usecase<List<ProjectEntity>, NoParams> {
  final ProjectRepository domainRepo;

  GetAllProjectsUseCase(this.domainRepo);

  @override
  Future<Either<Failure, List<ProjectEntity>>> call(NoParams params) {
    return domainRepo.getAllProjects();
  }
}
