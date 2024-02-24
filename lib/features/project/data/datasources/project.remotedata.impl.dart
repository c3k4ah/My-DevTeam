import 'package:pocketbase/pocketbase.dart';

import '../../../../core/source/remote/pocket_base_source.dart';
import '../data.dart';

class ProjectDataSourceImpl implements ProjectRemoteData {
  final PocketBaseSource pbSource;

  ProjectDataSourceImpl(this.pbSource);
  @override
  Future<ProjectModel> createProject({required ProjectModel project}) async {
    final result = await pbSource.create(
      collectionName: 'project',
      body: project.toJson(),
    );
    RecordModel record = result.data;
    return ProjectModel.fromJson(record.toJson());
  }

  @override
  Future<void> deleteProject({required String id}) async {
    await pbSource.delete(
      collectionName: 'project',
      recordId: id,
    );
  }

  @override
  Future<List<ProjectModel>> getAllProjects() async {
    final result = await pbSource.getAll(
      collectionName: 'project',
    );

    List<ProjectModel> data = result.data
        .map<ProjectModel>((RecordModel e) => ProjectModel.fromJson(e.toJson()))
        .toList();
    return data;
  }

  @override
  Future<ProjectModel> getProjectById({required String id}) async {
    final result = await pbSource.getById(
      collectionName: 'project',
      recordId: id,
    );
    return ProjectModel.fromJson(result.data);
  }

  @override
  Future<ProjectModel> updateProject({required ProjectModel project}) async {
    final result = await pbSource.update(
      collectionName: 'project',
      recordId: project.id ?? '',
      body: project.toJson(),
    );
    return ProjectModel.fromJson(result.data);
  }
}
