import '../domaine.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

abstract class ProjectDomainRepo {
  Future<Either<Failure, List<ProjectEntity>>> getAllProjects();
  Future<Either<Failure, ProjectEntity>> getProjectById({required int id});
  Future<Either<Failure, ProjectEntity>> createProject(
      {required ProjectEntity project});
  Future<Either<Failure, ProjectEntity>> updateProject(
      {required ProjectEntity project});
  Future<Either<Failure, void>> deleteProject({required int id});
}
