import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String get formatToMillier {
    NumberFormat formatter = NumberFormat.decimalPattern('fr_FR');
    formatter.maximumFractionDigits = 2;
    return formatter.format(this);
  }
}
