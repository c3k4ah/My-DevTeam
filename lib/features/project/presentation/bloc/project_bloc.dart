import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/domaine.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc()
      : super(const ProjectState(projects: [], status: ProjectStatus.initial));
}
