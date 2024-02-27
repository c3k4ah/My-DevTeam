import 'package:dartz/dartz.dart';

import '../../../../core/DTO/entities/task_entity.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/project.domain.repo.dart';

class UpdateTaskUseCase extends Usecase<TaskEntity, TaskEntity> {
  final ProjectRepository domainRepo;

  UpdateTaskUseCase(this.domainRepo);

  @override
  Future<Either<Failure, TaskEntity>> call(TaskEntity params) async {
    return await domainRepo.updateTask(task: params);
  }
}
