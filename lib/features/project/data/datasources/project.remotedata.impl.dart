import 'package:mydevteam/core/DTO/models/task_model.dart';
import 'package:mydevteam/core/DTO/models/user_model.dart';
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
    RecordModel record = result.data;
    return ProjectModel.fromJson(record.toJson());
  }

  @override
  Future<ProjectModel> updateProject({required ProjectModel project}) async {
    final result = await pbSource.update(
      collectionName: 'project',
      recordId: project.id ?? '',
      body: project.toJson(),
    );
    RecordModel record = result.data;
    return ProjectModel.fromJson(record.toJson());
  }

  @override
  Future<List<TaskModel>> getAllTasks({required List<String> tasksId}) async {
    final result = await pbSource.getAll(
      collectionName: 'task',
      filter: tasksId.isEmpty ? '' : 'projectId = "${tasksId.first}"',
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
    RecordModel record = result.data;
    return TaskModel.fromJson(record.toJson());
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

  @override
  Future<List<UserModel>> getAllUsers() async {
    final result = await pbSource.getAll(
      collectionName: 'users',
    );

    List<UserModel> data = result.data
        .map<UserModel>((RecordModel e) => UserModel.fromJson(e.toJson()))
        .toList();

    return data;
  }
}
