import '../entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
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
  }) : super(
          id: id,
          collectionId: collectionId,
          collectionName: collectionName,
          created: created,
          updated: updated,
          title: title,
          description: description,
          projectId: projectId,
          members: members,
          starDate: starDate,
          endDate: endDate,
          progression: progression,
        );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      collectionId: json['collectionId'],
      projectId: json['projectId'],
      collectionName: json['collectionName'],
      created: json['created'] == null ? null : DateTime.parse(json['created']),
      updated: json['updated'] == null ? null : DateTime.parse(json['updated']),
      title: json['title'],
      description: json['description'],
      members:
          json['members'] == null ? [] : List<String>.from(json['members']),
      starDate:
          json['star_date'] == null ? null : DateTime.parse(json['star_date']),
      endDate:
          json['end_date'] == null ? null : DateTime.parse(json['end_date']),
      progression: json['progression'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'updated': updated,
      'title': title,
      'description': description,
      'projectId': projectId,
      'members': members,
      'star_date': starDate,
      'end_date': endDate,
      'progression': progression,
    };
  }

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      projectId: entity.projectId,
      collectionId: entity.collectionId,
      collectionName: entity.collectionName,
      created: entity.created,
      updated: entity.updated,
      title: entity.title,
      description: entity.description,
      members: entity.members,
      starDate: entity.starDate,
      endDate: entity.endDate,
      progression: entity.progression,
    );
  }
}
