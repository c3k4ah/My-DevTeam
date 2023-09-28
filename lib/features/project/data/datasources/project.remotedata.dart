import '../data.dart';

abstract class ProjectRemoteData {
  Future<List<ProjectModel>> getAllProjects();
  Future<ProjectModel> getProjectById({required int id});
  Future<ProjectModel> createProject({required ProjectModel project});
  Future<ProjectModel> updateProject({required ProjectModel project});
  Future<void> deleteProject({required int id});
}
