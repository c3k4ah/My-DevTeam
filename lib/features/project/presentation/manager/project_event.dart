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

class ProjectLoardByIdEvent extends ProjectEvent {
  const ProjectLoardByIdEvent(this.project);

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

class ProjectLoadAllTaskEvent extends ProjectEvent {
  const ProjectLoadAllTaskEvent(this.taskIds);

  final List<String> taskIds;

  @override
  List<Object> get props => [taskIds];
}

class ProjectUpdateTaskEvent extends ProjectEvent {
  const ProjectUpdateTaskEvent(this.task);

  final TaskEntity task;

  @override
  List<Object> get props => [task];
}

class ProjectDeleteTaskEvent extends ProjectEvent {
  const ProjectDeleteTaskEvent(this.task);

  final TaskEntity task;

  @override
  List<Object> get props => [task];
}

class ProjectCreateTaskEvent extends ProjectEvent {
  const ProjectCreateTaskEvent(this.task);

  final TaskEntity task;

  @override
  List<Object> get props => [task];
}

class ProjectLoadAllUserEvent extends ProjectEvent {
  const ProjectLoadAllUserEvent();

  @override
  List<Object> get props => [];
}
