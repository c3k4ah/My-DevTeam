import 'package:mydevteam/core/DTO/entities/task_entity.dart';
import 'package:mydevteam/core/DTO/entities/user_enetity.dart';

import '../domaine.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectEntity>>> getAllProjects();
  Future<Either<Failure, ProjectEntity>> getProjectById({required String id});
  Future<Either<Failure, ProjectEntity>> createProject(
      {required ProjectEntity project});
  Future<Either<Failure, ProjectEntity>> updateProject(
      {required ProjectEntity project});
  Future<Either<Failure, void>> deleteProject({required String id});
  // Future<Either<Failure, List<ProjectEntity>>> searchProject(
  //     {required String query});
  Future<Either<Failure, List<TaskEntity>>> getAllTasks(
      {required List<String> tasksId});
  Future<Either<Failure, TaskEntity>> updateTask({required TaskEntity task});
  Future<Either<Failure, TaskEntity>> createTask({required TaskEntity task});
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
}
