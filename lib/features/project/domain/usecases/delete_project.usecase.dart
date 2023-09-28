import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/project.domain.repo.dart';

class DeleteProject extends Usecase<void, int> {
  final ProjectDomainRepo domainRepo;

  DeleteProject({required this.domainRepo});

  @override
  Future<Either<Failure, void>> call(int params) {
    return domainRepo.deleteProject(id: params);
  }
}
