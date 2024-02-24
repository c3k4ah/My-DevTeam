import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydevteam/core/extensions/date_time_extension.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:flutter_expandable_table/flutter_expandable_table.dart';

import '../bloc/project_bloc.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({super.key});

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
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
                child: CircularProgressIndicator(),
              );
            case ProjectStatus.loaded:
              return ScrollableTableView(
                paginationController: PaginationController(
                  rowCount: state.projects.length,
                  rowsPerPage: 10,
                ),
                headers: [
                  'Title',
                  'Progression',
                  'Members',
                  'StarDate',
                  'EndDate',
                  'Created',
                ].map((label) {
                  return TableViewHeader(
                    width: 220,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10),
                    label: label,
                  );
                }).toList(),
                rows: [
                  ...state.projects.map((project) {
                    return <String>[
                      project.title ?? '',
                      project.progression ?? '',
                      project.members?.length.toString() ?? '',
                      (project.starDate == null
                              ? ''
                              : project.starDate?.formatToHuman)
                          .toString(),
                      (project.endDate == null
                              ? ''
                              : project.endDate?.formatToHuman)
                          .toString(),
                      (project.created == null
                              ? ''
                              : project.created?.formatToHuman)
                          .toString(),
                    ];
                  }).toList(),
                ].map((record) {
                  return TableViewRow(
                    height: 60,
                    cells: record.map((value) {
                      return TableViewCell(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(value),
                      );
                    }).toList(),
                  );
                }).toList(),
              );
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

  ExpandableTableRow rowWidget() {
    return ExpandableTableRow(
      firstCell: cellWidget('title'),
      legend: const Text('legend'),
    );
  }

  ExpandableTableHeader cellHeaderWidget(String title) {
    return ExpandableTableHeader(cell: cellWidget(title));
  }

  ExpandableTableCell cellWidget(String title) {
    return ExpandableTableCell(
      builder: (context, details) {
        return Container(
          padding: const EdgeInsets.all(10),
          height: 70,
          decoration: const BoxDecoration(
            color: Colors.red,
            border: Border(
              right: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        );
      },
    );
  }
}
