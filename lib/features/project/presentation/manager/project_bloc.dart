// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mydevteam/core/DTO/entities/user_enetity.dart';

import '../../../../core/DTO/entities/task_entity.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/domaine.dart';
import '../../domain/usecases/get_all_user_usecase.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetAllProjectsUseCase getAllProjects;
  final GetProjectByIdUseCase getProjectById;
  final CreateProjectUseCase createProject;
  final UpdateProjectUseCase updateProject;
  final DeleteProjectUseCase deleteProject;
  final GetAllTaskUseCase getAllTasks;
  final UpdateTaskUseCase updateTask;
  final CreateTaskUseCase createTask;
  final GetAllUsersUseCase getUserList;

  ProjectBloc(
    this.getAllProjects,
    this.getProjectById,
    this.createProject,
    this.updateProject,
    this.deleteProject,
    this.getAllTasks,
    this.updateTask,
    this.createTask,
    this.getUserList,
  ) : super(ProjectInitial()) {
    // c'est ici que l'on va gérer les événements qui vont être émis par le bloc
    on<ProjectLoadEvent>(_onProjectLoadEvent);
    on<ProjectLoardByIdEvent>(_onProjectLoadByIdEvent);
    on<ProjectCreateEvent>(_onProjectCreateEvent);
    on<ProjectUpdateEvent>(_onProjectUpdateEvent);
    on<ProjectDeleteEvent>(_onProjectDeleteEvent);
    on<ProjectCreateTaskEvent>(_onProjectCreateTaskEvent);
    on<ProjectUpdateTaskEvent>(_onProjectUpdateTaskEvent);
    on<ProjectLoadAllTaskEvent>(_onProjectLoadAllTaskEvent);
    on<ProjectLoadAllUserEvent>(_onProjectLoadAllUserEvent);
  }

  Future<void> _onProjectLoadEvent(
      ProjectLoadEvent event, Emitter<ProjectState> emit) async {
    emit(state.copyWith(status: ProjectStatus.loading));
    final result = await getAllProjects(NoParams());
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: ProjectStatus.error,
          errorMessage: failure.message,
        ));
      },
      (projects) {
        emit(
          state.copyWith(
            status: ProjectStatus.loaded,
            projects: projects,
          ),
        );
      },
    );
  }

  Future<void> _onProjectCreateEvent(
      ProjectCreateEvent event, Emitter<ProjectState> emit) async {
    emit(state.copyWith(status: ProjectStatus.loading));
    final result = await createProject(event.project);
    result.fold(
      (failure) => emit(state.copyWith(
        status: ProjectStatus.error,
        errorMessage: failure.message,
      )),
      (project) => emit(state.copyWith(
        status: ProjectStatus.loaded,
        projects: [...state.projects, project],
      )),
    );
  }

  Future<void> _onProjectUpdateEvent(
      ProjectUpdateEvent event, Emitter<ProjectState> emit) async {
    emit(state.copyWith(status: ProjectStatus.loading));
    final result = await updateProject(event.project);
    result.fold(
      (failure) => emit(state.copyWith(
        status: ProjectStatus.error,
        errorMessage: failure.message,
      )),
      (project) => emit(state.copyWith(
        status: ProjectStatus.loaded,
        projects: [
          for (final item in state.projects)
            if (item.id == project.id) project else item
        ],
      )),
    );
  }

  Future<void> _onProjectDeleteEvent(
      ProjectDeleteEvent event, Emitter<ProjectState> emit) async {
    emit(state.copyWith(status: ProjectStatus.loading));
    final result = await deleteProject(event.project.id ?? '');

    result.fold(
      (failure) => emit(state.copyWith(
        status: ProjectStatus.error,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(
        status: ProjectStatus.loaded,
        projects: state.projects
            .where((element) => element.id != event.project.id)
            .toList(),
      )),
    );
  }

  Future<void> _onProjectLoadByIdEvent(
      ProjectLoardByIdEvent event, Emitter<ProjectState> emit) async {
    emit(state.copyWith(status: ProjectStatus.loading));
    final result = await getProjectById(event.project.id ?? '');
    result.fold(
      (failure) => emit(state.copyWith(
        status: ProjectStatus.error,
        errorMessage: failure.message,
      )),
      (project) => emit(state.copyWith(
        status: ProjectStatus.loaded,
        projects: [...state.projects, project],
      )),
    );
  }

  Future<void> _onProjectCreateTaskEvent(
      ProjectCreateTaskEvent event, Emitter<ProjectState> emit) async {
    emit(state.copyWith(status: ProjectStatus.loading));
    final result = await createTask(event.task);
    result.fold(
      (failure) => emit(state.copyWith(
        status: ProjectStatus.error,
        errorMessage: failure.message,
      )),
      (task) => emit(state.copyWith(
        tasks: [...state.tasks, task],
        status: ProjectStatus.loaded,
      )),
    );
  }

  Future<void> _onProjectUpdateTaskEvent(
      ProjectUpdateTaskEvent event, Emitter<ProjectState> emit) async {
    // emit(state.copyWith(status: ProjectStatus.loading));
    final result = await updateTask(event.task);
    result.fold(
      (failure) => emit(state.copyWith(
        status: ProjectStatus.error,
        errorMessage: failure.message,
      )),
      (task) {
        emit(state.copyWith(
          status: ProjectStatus.loaded,
          tasks: [
            for (final item in state.tasks)
              if (item.id == task.id) task else item
          ],
        ));
      },
    );
  }

  Future<void> _onProjectLoadAllTaskEvent(
      ProjectLoadAllTaskEvent event, Emitter<ProjectState> emit) async {
    emit(state.copyWith(status: ProjectStatus.loading));
    final result = await getAllTasks(event.taskIds);
    result.fold(
      (failure) => emit(state.copyWith(
        status: ProjectStatus.error,
        errorMessage: failure.message,
      )),
      (tasks) {
        emit(state.copyWith(
          status: ProjectStatus.loaded,
          tasks: tasks,
        ));
      },
    );
  }

  Future<void> _onProjectLoadAllUserEvent(
      ProjectLoadAllUserEvent event, Emitter<ProjectState> emit) async {
    emit(state.copyWith(status: ProjectStatus.loading));
    final result = await getUserList(NoParams());
    result.fold(
      (failure) => emit(state.copyWith(
        status: ProjectStatus.error,
        errorMessage: failure.message,
      )),
      (users) {
        emit(
          state.copyWith(
            status: ProjectStatus.loaded,
            users: users,
          ),
        );
        // print(users);
      },
    );
  }
}
