import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  const TaskEntity({
    this.id,
    this.projectId,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.title,
    this.description,
    this.members,
    this.starDate,
    this.endDate,
    this.progression,
  });

  final String? id;
  final String? projectId;
  final String? collectionId;
  final String? collectionName;
  final DateTime? created;
  final DateTime? updated;
  final String? title;
  final String? description;
  final List<String>? members;
  final DateTime? starDate;
  final DateTime? endDate;
  final int? progression;

  TaskEntity copyWith({
    String? id,
    String? projectId,
    String? collectionId,
    String? collectionName,
    DateTime? created,
    DateTime? updated,
    String? title,
    String? description,
    List<String>? members,
    DateTime? starDate,
    DateTime? endDate,
    int? progression,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      projectId: projectId ?? this.projectId,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      title: title ?? this.title,
      description: description ?? this.description,
      members: members ?? this.members,
      starDate: starDate ?? this.starDate,
      endDate: endDate ?? this.endDate,
      progression: progression ?? this.progression,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created?.toIso8601String(),
      'updated': updated?.toIso8601String(),
      'title': title,
      'description': description,
      'projectId': projectId,
      'members': members,
      'start_date': starDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'progression': progression,
    };
  }

  @override
  List<Object?> get props => [
        id,
        collectionId,
        collectionName,
        created,
        projectId,
        updated,
        title,
        description,
        members,
        starDate,
        endDate,
        progression,
      ];
}
