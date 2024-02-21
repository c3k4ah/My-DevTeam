import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formatToHuman {
    return DateFormat.yMEd('fr_FR').format(this);
  }
}
