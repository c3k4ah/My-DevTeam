import '../data.dart';

class ProjectDataSourceImpl implements ProjectRemoteData {
  @override
  Future<ProjectModel> createProject({required ProjectModel project}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProject({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<List<ProjectModel>> getAllProjects() {
    throw UnimplementedError();
  }

  @override
  Future<ProjectModel> getProjectById({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<ProjectModel> updateProject({required ProjectModel project}) {
    throw UnimplementedError();
  }
}
