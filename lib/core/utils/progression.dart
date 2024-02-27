import 'package:flutter/material.dart';

class Progression {
  final String title;
  final int status;

  Progression({
    required this.title,
    required this.status,
  });

  @override
  toString() => title;
}

class ProgressionRepository {
  final List<Progression> _progressions = [
    Progression(title: 'All', status: 0),
    Progression(title: 'To Do', status: 5),
    Progression(title: 'In Progress', status: 1),
    Progression(title: 'Pending', status: 2),
    Progression(title: 'Completed', status: 3),
    Progression(title: 'In Review', status: 4),
  ];

  List<Progression> get progressions => _progressions;

  Progression getProgressionByStatus(int status) {
    if (status > 5 || status < 0) return _progressions[1];
    return _progressions.firstWhere((element) => element.status == status);
  }

  Color getProgressionColorByStatus(int status) {
    switch (status) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.amber;
      case 3:
        return Colors.blue;
      case 4:
        return Colors.deepOrange;
      case 5:
        return Colors.purple;
      default:
        return Colors.black26;
    }
  }
}
