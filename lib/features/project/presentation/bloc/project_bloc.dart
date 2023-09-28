// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/domaine.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  // on a besoin de nos usecases pour faire le lien avec le domaine et la data
  final GetAllProjects getAllProjects;
  final GetProjectById getProjectById;
  final CreateProject createProject;
  final UpdateProject updateProject;
  final DeleteProject deleteProject;

  ProjectBloc({
    required this.getAllProjects,
    required this.getProjectById,
    required this.createProject,
    required this.updateProject,
    required this.deleteProject,
  }) : super(
            // on initialise le state avec les valeurs par défaut
            const ProjectState(
          projects: [],
          status: ProjectStatus.initial,
          errorMessage: '',
        )) {
    // c'est ici que l'on va gérer les événements qui vont être émis par le bloc
    on<ProjectLoadEvent>(_onProjectLoadEvent);
    on<ProjectLoardByIdEvent>(_onProjectLoadByIdEvent);
    on<ProjectCreateEvent>(_onProjectCreateEvent);
    on<ProjectUpdateEvent>(_onProjectUpdateEvent);
    on<ProjectDeleteEvent>(_onProjectDeleteEvent);
  }

  void _onProjectLoadEvent(ProjectLoadEvent event, Emitter<ProjectState> emit) {
    emit(state.copyWith(status: ProjectStatus.loading));
    getAllProjects(NoParams()).then((result) {
      result.fold(
        (failure) => emit(state.copyWith(
          status: ProjectStatus.error,
          errorMessage: failure.message,
        )),
        (projects) => emit(
            state.copyWith(status: ProjectStatus.loaded, projects: projects)),
      );
    });
  }

  void _onProjectCreateEvent(
      ProjectCreateEvent event, Emitter<ProjectState> emit) {
    emit(state.copyWith(status: ProjectStatus.loading));
    createProject(event.project).then((result) {
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
    });
  }

  void _onProjectUpdateEvent(
      ProjectUpdateEvent event, Emitter<ProjectState> emit) {
    emit(state.copyWith(status: ProjectStatus.loading));
    updateProject(event.project).then((result) {
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
    });
  }

  void _onProjectDeleteEvent(
      ProjectDeleteEvent event, Emitter<ProjectState> emit) {
    emit(state.copyWith(status: ProjectStatus.loading));
    deleteProject(event.project.id).then((result) {
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
    });
  }

  void _onProjectLoadByIdEvent(
      ProjectLoardByIdEvent event, Emitter<ProjectState> emit) {
    emit(state.copyWith(status: ProjectStatus.loading));
    getProjectById(event.project.id).then((result) {
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
    });
  }
}
