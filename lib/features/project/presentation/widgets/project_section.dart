import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydevteam/core/extensions/date_time_extension.dart';
import 'package:mydevteam/features/project/domain/domaine.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/progression.dart';

import '../manager/project_bloc.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({super.key});

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  final _prs = ProgressionRepository();

  @override
  void initState() {
    context.read<ProjectBloc>().add(const ProjectLoadEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          style: BorderStyle.solid,
          width: 3,
          color: Colors.blue.withOpacity(.3),
        ),
      ),
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          switch (state.status) {
            case ProjectStatus.loading:
              return const Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 3,
                  ),
                ),
              );
            case ProjectStatus.loaded || ProjectStatus.initial:
              return ScrollableTableView(
                  paginationController: PaginationController(
                    rowCount: state.projects.length,
                    rowsPerPage: 10,
                  ),
                  headers: [
                    'Title',
                    'Members',
                    'Star date',
                    'Deadline',
                    'Date created',
                    'Status',
                  ].map((label) {
                    return TableViewHeader(
                      width: 220,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 10),
                      label: label,
                    );
                  }).toList(),
                  rows: List.generate(state.projects.length, (index) {
                    ProjectEntity project = state.projects[index];
                    return TableViewRow(
                      onTap: () {
                        context
                            .pushRoute(ProjectDetailsRoute(project: project));
                      },
                      cells: [
                        TableViewCell(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(project.title ?? ''),
                        ),
                        TableViewCell(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            '${project.members?.length}${project.members!.length <= 1 ? ' executor' : ' executors'}',
                          ),
                        ),
                        TableViewCell(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            (project.starDate == null
                                    ? ''
                                    : project.starDate?.formatToHuman)
                                .toString(),
                          ),
                        ),
                        TableViewCell(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            (project.endDate == null
                                    ? ''
                                    : project.endDate?.formatToHuman)
                                .toString(),
                          ),
                        ),
                        TableViewCell(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            (project.created == null
                                    ? ''
                                    : project.created?.formatToHuman)
                                .toString(),
                          ),
                        ),
                        TableViewCell(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                              color: _prs.getProgressionColorByStatus(
                                  project.progression ?? 5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              _prs
                                  .getProgressionByStatus(
                                      project.progression ?? 5)
                                  .toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }));
            case ProjectStatus.error:
              return Center(
                child: Text(state.errorMessage),
              );
            default:
              return const Center(
                child: Text('Error'),
              );
          }
        },
      ),
    );
  }
}
