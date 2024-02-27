import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydevteam/core/DTO/entities/task_entity.dart';
import 'package:mydevteam/core/extensions/date_time_extension.dart';

import '../../../../core/utils/progression.dart';
import '../../domain/domaine.dart';
import '../manager/project_bloc.dart';

@RoutePage()
class ProjectDetailsPage extends StatefulWidget {
  final ProjectEntity project;
  const ProjectDetailsPage({super.key, required this.project});

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  late AppFlowyBoardController controller;

  late AppFlowyBoardScrollController boardController;
  final _prs = ProgressionRepository();
  List<AppFlowyGroupData> groupsData = [];
  // List<TaskEntity> tasks = [];
  @override
  void initState() {
    print(widget.project.tasks?.length);
    context
        .read<ProjectBloc>()
        .add(ProjectLoadAllTaskEvent([widget.project.id ?? '']));

    boardController = AppFlowyBoardScrollController();
    controller = AppFlowyBoardController(
      onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
        debugPrint('Move item from $fromIndex to $toIndex');
      },
      onMoveGroupItem: (groupId, fromIndex, toIndex) {
        debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex');
      },
      onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
        debugPrint('Task $fromGroupId to $toGroupId');
        print('========================================');

        print(controller.getGroupController(toGroupId)!.items[toIndex]);

        context.read<ProjectBloc>().add(
              ProjectUpdateTaskEvent(
                TaskEntity(
                  id: controller
                      .getGroupController(toGroupId)!
                      .items[toIndex]
                      .id,
                  progression: int.parse(toGroupId),
                ),
              ),
            );
      },
    );
    // tasks = context.read<ProjectBloc>().state.tasks;
    // addAllTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppFlowyBoardConfig config = const AppFlowyBoardConfig(
      groupBackgroundColor: Color(0xffF7F8FC),
      stretchGroupHeight: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.title ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            BlocConsumer<ProjectBloc, ProjectState>(
              listener: (context, state) {
                if (state.status == ProjectStatus.loaded) {
                  groupsData = _prs.progressions
                      .map(
                        (Progression e) => AppFlowyGroupData(
                          id: e.status.toString(),
                          name: e.title,
                          items: <AppFlowyGroupItem>[
                            ...state.tasks
                                .where((TaskEntity element) =>
                                    element.progression == e.status)
                                .map(
                                  (TaskEntity task) => TaskCard(
                                    task.title ?? '',
                                    '${task.endDate?.formatToHuman}',
                                    task,
                                    task.id ?? '',
                                  ),
                                )
                                .toList()
                          ],
                        ),
                      )
                      .toList();
                  for (AppFlowyGroupData group in groupsData) {
                    if (group.id != '0') {
                      controller.addGroup(group);
                    }
                  }
                }
              },
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
                  case ProjectStatus.loaded:
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height * .7,
                      width: MediaQuery.sizeOf(context).width,
                      child: AppFlowyBoard(
                        controller: controller,
                        cardBuilder: (context, group, groupItem) {
                          return AppFlowyGroupCard(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            key: ValueKey(groupItem.id),
                            child: _buildCard(groupItem),
                          );
                        },
                        boardScrollController: boardController,
                        footerBuilder: (context, columnData) {
                          return AppFlowyGroupFooter(
                            icon: const Icon(Icons.add, size: 20),
                            title: const Text('New'),
                            height: 50,
                            margin: config.groupPadding,
                            onAddButtonClick: () {
                              boardController.scrollToBottom(columnData.id);
                            },
                          );
                        },
                        headerBuilder: (context, columnData) {
                          return AppFlowyGroupHeader(
                            icon: Icon(
                              Icons.lightbulb_circle,
                              color: _prs.getProgressionColorByStatus(
                                  int.parse(columnData.headerData.groupId)),
                            ),
                            title: SizedBox(
                              width: 100,
                              child: Text(
                                columnData.headerData.groupName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            addIcon: const Icon(Icons.add, size: 20),
                            moreIcon: const Icon(Icons.more_horiz, size: 20),
                            height: 50,
                            margin: config.groupPadding,
                          );
                        },
                        groupConstraints:
                            const BoxConstraints.tightFor(width: 240),
                        config: config,
                      ),
                    );

                  case ProjectStatus.error:
                    return const Center(
                      child: Text('Error'),
                    );
                  default:
                    return const Center(
                      child: Text('Error'),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(AppFlowyGroupItem item) {
    if (item is TaskCard) {
      return RichTextCard(item: item);
    }

    throw UnimplementedError();
  }
}

class RichTextCard extends StatefulWidget {
  final TaskCard item;
  const RichTextCard({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  State<RichTextCard> createState() => _RichTextCardState();
}

class _RichTextCardState extends State<RichTextCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.item.title,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          Text(
            widget.item.subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class TaskCard extends AppFlowyGroupItem {
  final String taskId;
  final String title;
  final String subtitle;
  final TaskEntity task;
  TaskCard(this.title, this.subtitle, this.task, this.taskId);
  @override
  String get id => taskId;
}
