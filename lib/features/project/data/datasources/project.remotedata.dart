import '../../../../core/DTO/models/task_model.dart';
import '../data.dart';

abstract class ProjectRemoteData {
  Future<List<ProjectModel>> getAllProjects();
  Future<ProjectModel> getProjectById({required String id});
  Future<ProjectModel> createProject({required ProjectModel project});
  Future<ProjectModel> updateProject({required ProjectModel project});
  Future<void> deleteProject({required String id});
  // Future<List<ProjectModel>> searchProject({required String query});
  Future<List<TaskModel>> getAllTasks({required List<String> tasksId});
  Future<TaskModel> updateTask({required TaskModel task});
  Future<TaskModel> createTask({required TaskModel task});
}
