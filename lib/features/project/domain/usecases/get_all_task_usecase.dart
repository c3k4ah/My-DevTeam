import 'package:dartz/dartz.dart';
import 'package:mydevteam/core/DTO/entities/task_entity.dart';
import 'package:mydevteam/core/error/failure.dart';
import 'package:mydevteam/core/usecase/usecase.dart';

import '../repositories/project.domain.repo.dart';

class GetAllTaskUseCase extends Usecase<List<TaskEntity>, List<String>> {
  final ProjectRepository domainRepo;

  GetAllTaskUseCase(this.domainRepo);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(List<String> params) async {
    return await domainRepo.getAllTasks(tasksId: params);
  }
}
