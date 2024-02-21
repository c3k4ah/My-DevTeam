import 'dart:ui';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class OperationDataSource extends CalendarDataSource {
  /// Crée une source de données pour les opérations, qui est utilisée pour définir la collection d'appointements sur le calendrier.
  OperationDataSource(List<Operation> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getOperationData(index).startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return _getOperationData(index).endTime;
  }

  @override
  String getSubject(int index) {
    return _getOperationData(index).operationName;
  }

  @override
  Color getColor(int index) {
    return _getOperationData(index).color;
  }

  @override
  bool isAllDay(int index) {
    return _getOperationData(index).isAllDay;
  }

  Operation _getOperationData(int index) {
    final dynamic operation = appointments![index];
    late final Operation operationData;
    if (operation is Operation) {
      operationData = operation;
    }

    return operationData;
  }
}

class Operation {
  /// Crée une instance de la classe Operation avec les détails requis.
  Operation(this.operationName, this.startTime, this.endTime, this.color,
      this.isAllDay);

  /// Nom de l'opération, équivalent à la propriété subject de [Appointment].
  String operationName;

  /// Heure de début, équivalent à la propriété startTime de [Appointment].
  DateTime startTime;

  /// Heure de fin, équivalent à la propriété endTime de [Appointment].
  DateTime endTime;

  /// Couleur, équivalent à la propriété color de [Appointment].
  Color color;

  /// Est-ce que l'opération est un événement de toute la journée, équivalent à la propriété isAllDay de [Appointment].
  bool isAllDay;
}
