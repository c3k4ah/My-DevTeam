// import 'package:flutter/material.dart';

// import 'package:syncfusion_flutter_calendar/calendar.dart';

// import '../../../../../core/utils/metting_adapter.dart';

// class Edt extends StatelessWidget {
//   const Edt({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(2),
//       margin: const EdgeInsets.only(bottom: 20),
//       height: 300,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: SfCalendar(
//         firstDayOfWeek: 1,
//         view: CalendarView.week,
//         dataSource: MeetingDataSource(_getDataSource()),
//       ),
//     );
//   }
// }

// List<Meeting> _getDataSource() {
//   final List<Meeting> meetings = <Meeting>[];
//   final DateTime today = DateTime.now();
//   final DateTime startTime = DateTime(today.year, today.month, today.day, 19);
//   final DateTime endTime = startTime.add(const Duration(hours: 2));
//   meetings.add(Meeting(
//       'Reunion client', startTime, endTime, const Color(0xFF0F8644), false));
//   return meetings;
// }
