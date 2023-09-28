// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:mydevteam/core/error/failure.dart';

import '../../domain/domaine.dart';
import '../data.dart';

class ProjectDataRepo implements ProjectDomainRepo {
  final ProjectRemoteData remoteData;
  ProjectDataRepo({
    required this.remoteData,
  });

  @override
  Future<Either<Failure, ProjectEntity>> createProject(
      {required ProjectEntity project}) async {
    try {
      final result = await remoteData.createProject(
          project: ProjectModel.fromEntity(project));
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProject({required int id}) async {
    try {
      final result = await remoteData.deleteProject(id: id);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>> getAllProjects() async {
    try {
      final result = await remoteData.getAllProjects();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProjectEntity>> getProjectById(
      {required int id}) async {
    try {
      final result = await remoteData.getProjectById(id: id);
      return Right(result);
    } catch (e) {
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
      return const Left(ServerFailure());
    }
  }
}
