part of 'project_bloc.dart';

enum ProjectStatus { initial, loading, loaded, error }

class ProjectState extends Equatable {
  const ProjectState({
    required this.projects,
    required this.status,
    required this.errorMessage,
  });

  final List<ProjectEntity> projects;
  final ProjectStatus status;
  final String errorMessage;

  ProjectState copyWith({
    List<ProjectEntity>? projects,
    ProjectStatus? status,
    String? errorMessage,
  }) {
    return ProjectState(
      projects: projects ?? this.projects,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [projects, status, errorMessage];
}
