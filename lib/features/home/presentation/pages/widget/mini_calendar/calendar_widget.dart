import 'package:flutter/material.dart';

import 'calendar.dart';
import 'doctor.dart';
import 'someone.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Calendar(),
        SizedBox(
          height: 20,
        ),
        Doctor(),
        SizedBox(
          height: 15,
        ),
        Someone(),
      ],
    );
  }
}
