part of 'project_bloc.dart';

enum ProjectStatus { initial, loading, loaded, error }

class ProjectState extends Equatable {
  const ProjectState({
    required this.projects,
    required this.status,
    required this.errorMessage,
    required this.tasks,
  });

  final List<ProjectEntity> projects;
  final List<TaskEntity> tasks;
  final ProjectStatus status;
  final String errorMessage;

  ProjectState copyWith({
    List<ProjectEntity>? projects,
    List<TaskEntity>? tasks,
    ProjectStatus? status,
    String? errorMessage,
  }) {
    return ProjectState(
      projects: projects ?? this.projects,
      tasks: tasks ?? this.tasks,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        projects,
        tasks,
        status,
        errorMessage,
      ];
}

class ProjectInitial extends ProjectState {
  ProjectInitial()
      : super(
          projects: projectsList,
          tasks: [],
          status: ProjectStatus.initial,
          errorMessage: '',
        );
}

List<ProjectEntity> projectsList = [
  ProjectEntity(
    progression: 1,
    title: "Aiz Izy Zan",
    members: const ["memebre 1", "membre 2"],
    description: "Projet de soutenance",
    starDate: DateTime.now(),
    endDate: DateTime.now(),
    created: DateTime.now(),
  ),
  ProjectEntity(
    progression: 5,
    title: "MyDevTeam",
    members: const ["memebre 1", "membre 2"],
    description: "Projet de soutenance",
    starDate: DateTime.now(),
    endDate: DateTime.now(),
    created: DateTime.now(),
  ),
  ProjectEntity(
    progression: 4,
    title: "AreaTech",
    members: const ["memebre 1", "membre 2"],
    description: "Projet de soutenance",
    starDate: DateTime.now(),
    endDate: DateTime.now(),
    created: DateTime.now(),
  ),
  ProjectEntity(
    progression: 3,
    title: "MyDevTeam",
    members: const ["memebre 1", "membre 2"],
    description: "Projet de soutenance",
    starDate: DateTime.now(),
    endDate: DateTime.now(),
    created: DateTime.now(),
  ),
  ProjectEntity(
    progression: 2,
    title: "Diaspora",
    members: const ["memebre 1", "membre 2"],
    description: "Projet de soutenance",
    starDate: DateTime.now(),
    endDate: DateTime.now(),
    created: DateTime.now(),
  ),
];
