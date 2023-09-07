part of 'project_bloc.dart';

abstract class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}

class ProjectLoadEvent extends ProjectEvent {
  const ProjectLoadEvent();
}

class ProjectCreateEvent extends ProjectEvent {
  const ProjectCreateEvent(this.project);

  final ProjectEntity project;

  @override
  List<Object> get props => [project];
}

class ProjectUpdateEvent extends ProjectEvent {
  const ProjectUpdateEvent(this.project);

  final ProjectEntity project;

  @override
  List<Object> get props => [project];
}

class ProjectDeleteEvent extends ProjectEvent {
  const ProjectDeleteEvent(this.project);

  final ProjectEntity project;

  @override
  List<Object> get props => [project];
}
