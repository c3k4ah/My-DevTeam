import '../data.dart';

class ProjectDataSourceImpl implements ProjectRemoteData {
  @override
  Future<ProjectModel> createProject({required ProjectModel project}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProject({required int id}) {
    throw UnimplementedError();
  }

  @override
  Future<List<ProjectModel>> getAllProjects() {
    throw UnimplementedError();
  }

  @override
  Future<ProjectModel> getProjectById({required int id}) {
    throw UnimplementedError();
  }

  @override
  Future<ProjectModel> updateProject({required ProjectModel project}) {
    throw UnimplementedError();
  }
}
