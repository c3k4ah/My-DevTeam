import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/domaine.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc()
      : super(const ProjectState(
          projects: [],
          status: ProjectStatus.initial,
        )) {
    on<ProjectLoadEvent>(_onProjectLoadEvent);
    on<ProjectLoardByIdEvent>(_onProjectLoadByIdEvent);
    on<ProjectCreateEvent>(_onProjectCreateEvent);
    on<ProjectUpdateEvent>(_onProjectUpdateEvent);
    on<ProjectDeleteEvent>(_onProjectDeleteEvent);
  }

  void _onProjectLoadEvent(
      ProjectLoadEvent event, Emitter<ProjectState> emit) {}
  void _onProjectCreateEvent(
      ProjectCreateEvent event, Emitter<ProjectState> emit) {}
  void _onProjectUpdateEvent(
      ProjectUpdateEvent event, Emitter<ProjectState> emit) {}
  void _onProjectDeleteEvent(
      ProjectDeleteEvent event, Emitter<ProjectState> emit) {}
  void _onProjectLoadByIdEvent(
      ProjectLoardByIdEvent event, Emitter<ProjectState> emit) {}
}
