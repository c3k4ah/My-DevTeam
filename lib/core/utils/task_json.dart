import 'dart:convert';

import '../DTO/entities/task_entity.dart';

TaskEntity entityAdapater(String jsonString) {
  Map<String, dynamic> json = jsonDecode(jsonString);
  return TaskEntity(
    id: json['id'],
    collectionId: json['collectionId'],
    projectId: json['projectId'],
    collectionName: json['collectionName'],
    created: json['created'] == null ? null : DateTime.parse(json['created']),
    updated: json['updated'] == null ? null : DateTime.parse(json['updated']),
    title: json['title'],
    description: json['description'],
    members: json['members'] == null ? [] : List<String>.from(json['members']),
    starDate:
        json['start_date'] == null ? null : DateTime.parse(json['start_date']),
    endDate: json['end_date'] == null ? null : DateTime.parse(json['end_date']),
    progression: json['progression'] ?? 5,
  );
}
