import 'package:flutter/material.dart';
import 'package:clean_calendar/clean_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return CleanCalendar(
      startWeekday: WeekDay.monday,
      generalDatesProperties: DatesProperties(
          datesDecoration: DatesDecoration(datesBorderColor: Colors.white)),
      weekdaysProperties: WeekdaysProperties(),
      currentDateProperties: DatesProperties(
          datesDecoration: DatesDecoration(
              datesBackgroundColor: Colors.blue,
              datesBorderColor: Colors.blue)),
    );
  }
}
