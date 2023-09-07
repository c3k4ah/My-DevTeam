part of 'project_bloc.dart';

enum ProjectStatus { initial, loading, loaded, error }

class ProjectState extends Equatable {
  const ProjectState({
    required this.projects,
    required this.status,
  });

  final List<ProjectEntity> projects;
  final ProjectStatus status;

  ProjectState copyWith({
    List<ProjectEntity>? projects,
    ProjectStatus? status,
  }) {
    return ProjectState(
      projects: projects ?? this.projects,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [projects, status];
}
