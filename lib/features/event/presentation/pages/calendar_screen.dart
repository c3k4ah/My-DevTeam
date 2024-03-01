import 'package:auto_route/auto_route.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydevteam/core/DTO/entities/task_entity.dart';

import '../../../../core/utils/progression.dart';
import '../../../project/presentation/manager/project_bloc.dart';
import '../../../project/presentation/widgets/search_bar.dart';

@RoutePage()
class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final ProgressionRepository _prs = ProgressionRepository();

  @override
  void initState() {
    context.read<ProjectBloc>().add(const ProjectLoadAllTaskEvent([]));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      body: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          if (mounted) {
            List<CalendarEventData> events = state.tasks
                .map((e) => CalendarEventData(
                      date: e.starDate ?? DateTime.now(),
                      title: e.title ?? '',
                      color: _prs.getColor(e.progression ?? 0),
                    ))
                .toList();
            CalendarControllerProvider.of(context).controller.addAll(events);
          }
          return Column(
            children: [
              SizedBox(
                height: 70,
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Calendrier',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      child: const SearchBarWidget(
                        barColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        margin: const EdgeInsets.all(10),
                        // height: MediaQuery.sizeOf(context).height * 0.8,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: MonthView(
                            cellAspectRatio: 1,
                            borderSize: 0.5,
                            cellBuilder: (date, event, isToday, isInMonth) {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      width: double.infinity,
                                      height: 60,
                                      child: Text(
                                        date.day.toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: isToday
                                              ? Colors.blue
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    if (event.isNotEmpty)
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: event.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding: const EdgeInsets.all(5),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                vertical: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                border: Border(
                                                  left: BorderSide(
                                                    color: event[index].color,
                                                    width: 5,
                                                  ),
                                                ),
                                              ),
                                              child: Text(
                                                event[index].title,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                            headerStyle: const HeaderStyle(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Tâches',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: state.tasks.length,
                                itemBuilder: (context, index) {
                                  TaskEntity task = state.tasks[index];
                                  return Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey.withOpacity(0.5),
                                          width: 0.5,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            color: _prs.getColor(state
                                                    .tasks[index].progression ??
                                                0),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                task.title ?? '',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 17),
                                              ),
                                              Text(
                                                task.description ?? '',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
