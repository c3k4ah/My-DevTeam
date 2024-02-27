// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:mydevteam/core/DTO/entities/task_entity.dart';

import 'package:mydevteam/core/error/failure.dart';

import '../../../../core/DTO/models/task_model.dart';
import '../../../../core/utils/log.dart';
import '../../domain/domaine.dart';
import '../data.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteData remoteData;
  ProjectRepositoryImpl(
    this.remoteData,
  );

  @override
  Future<Either<Failure, ProjectEntity>> createProject(
      {required ProjectEntity project}) async {
    try {
      final result = await remoteData.createProject(
          project: ProjectModel.fromEntity(project));
      return Right(result);
    } catch (e) {
      Log.error(e);
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProject({required String id}) async {
    try {
      final result = await remoteData.deleteProject(id: id);
      return Right(result);
    } catch (e) {
      Log.error(e);
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>> getAllProjects() async {
    try {
      final result = await remoteData.getAllProjects();
      return Right(result);
    } catch (e) {
      Log.error(e);
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProjectEntity>> getProjectById(
      {required String id}) async {
    try {
      final result = await remoteData.getProjectById(id: id);
      return Right(result);
    } catch (e) {
      Log.error(e);
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProjectEntity>> updateProject(
      {required ProjectEntity project}) async {
    try {
      final result = await remoteData.updateProject(
          project: ProjectModel.fromEntity(project));
      return Right(result);
    } catch (e) {
      Log.error(e);
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks(
      {required List<String> tasksId}) async {
    try {
      final result = await remoteData.getAllTasks(tasksId: tasksId);
      return Right(result);
    } catch (e) {
      Log.error(e);
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> updateTask(
      {required TaskEntity task}) async {
    try {
      final result =
          await remoteData.updateTask(task: TaskModel.fromEntity(task));
      return Right(result);
    } catch (e) {
      Log.error(e);
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> createTask(
      {required TaskEntity task}) async {
    try {
      final result =
          await remoteData.createTask(task: TaskModel.fromEntity(task));
      return Right(result);
    } catch (e) {
      Log.error(e);
      return const Left(ServerFailure());
    }
  }
}
