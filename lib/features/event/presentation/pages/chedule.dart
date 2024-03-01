import 'package:calendar_view/calendar_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydevteam/features/project/presentation/manager/project_bloc.dart';

import '../../../../core/utils/progression.dart';

class CalendarEventWidget extends StatefulWidget {
  final double? hgt;
  const CalendarEventWidget({super.key, this.hgt});

  @override
  State<CalendarEventWidget> createState() => _CalendarEventWidgetState();
}

class _CalendarEventWidgetState extends State<CalendarEventWidget> {
  final ProgressionRepository _prs = ProgressionRepository();

  @override
  void initState() {
    context.read<ProjectBloc>().add(const ProjectLoadAllTaskEvent([]));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
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
        return Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.only(bottom: 20),
          height: widget.hgt ?? 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: MonthView(
            cellAspectRatio: 1,
            cellBuilder: (date, event, isToday, isInMonth) {
              return Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Text(
                        date.day.toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: isToday ? Colors.blue : Colors.black,
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
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border(
                                    left: BorderSide(
                                      color: event[index].color,
                                      width: 5,
                                    ),
                                  )),
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
        );
      },
    );
  }
}
