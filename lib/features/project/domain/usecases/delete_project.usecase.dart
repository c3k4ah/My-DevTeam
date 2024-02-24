import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/project.domain.repo.dart';

class DeleteProjectUseCase extends Usecase<void, String> {
  final ProjectRepository domainRepo;

  DeleteProjectUseCase(this.domainRepo);

  @override
  Future<Either<Failure, void>> call(String params) {
    return domainRepo.deleteProject(id: params);
  }
}
