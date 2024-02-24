// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/domaine.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  // on a besoin de nos usecases pour faire le lien avec le domaine et la data
  final GetAllProjectsUseCase getAllProjects;
  final GetProjectByIdUseCase getProjectById;
  final CreateProjectUseCase createProject;
  final UpdateProjectUseCase updateProject;
  final DeleteProjectUseCase deleteProject;

  ProjectBloc(
    this.getAllProjects,
    this.getProjectById,
    this.createProject,
    this.updateProject,
    this.deleteProject,
  ) : super(ProjectInitial()) {
    // c'est ici que l'on va gérer les événements qui vont être émis par le bloc
    on<ProjectLoadEvent>(_onProjectLoadEvent);
    on<ProjectLoardByIdEvent>(_onProjectLoadByIdEvent);
    on<ProjectCreateEvent>(_onProjectCreateEvent);
    on<ProjectUpdateEvent>(_onProjectUpdateEvent);
    on<ProjectDeleteEvent>(_onProjectDeleteEvent);
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
        print(failure.message);
      },
      (projects) {
        emit(state.copyWith(status: ProjectStatus.loaded, projects: projects));
        print(projects.length);
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
}
