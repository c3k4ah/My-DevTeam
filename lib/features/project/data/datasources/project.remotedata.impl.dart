import 'package:mydevteam/core/DTO/models/task_model.dart';
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

  @override
  Future<List<TaskModel>> getAllTasks({required List<String> tasksId}) async {
    String filter = tasksId.map((id) => 'id = "$id"').join(' || ');
    final result = await pbSource.getAll(
      collectionName: 'task',
      filter: 'projectId = "${tasksId.first}"',
    );
    List<TaskModel> data = result.data
        .map<TaskModel>((RecordModel e) => TaskModel.fromJson(e.toJson()))
        .toList();
    return data;
  }

  @override
  Future<TaskModel> updateTask({required TaskModel task}) async {
    final result = await pbSource.update(
      collectionName: 'task',
      recordId: task.id ?? '',
      body: task.toJson(),
    );
    return TaskModel.fromJson(result.data);
  }

  @override
  Future<TaskModel> createTask({required TaskModel task}) async {
    final result = await pbSource.create(
      collectionName: 'task',
      body: task.toJson(),
    );
    RecordModel record = result.data;
    return TaskModel.fromJson(record.toJson());
  }
}
