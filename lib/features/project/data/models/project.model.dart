import '../../domain/domaine.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    String? id,
    String? collectionId,
    String? collectionName,
    DateTime? created,
    DateTime? updated,
    String? title,
    String? description,
    List<String>? documents,
    List<String>? members,
    List<String>? sprint,
    List<String>? managers,
    DateTime? starDate,
    DateTime? endDate,
    String? progression,
  }) : super(
          id: id,
          collectionId: collectionId,
          collectionName: collectionName,
          created: created,
          updated: updated,
          title: title,
          description: description,
          documents: documents,
          members: members,
          sprint: sprint,
          managers: managers,
          starDate: starDate,
          endDate: endDate,
          progression: progression,
        );

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: json['created'] == null ? null : DateTime.parse(json['created']),
      updated: json['updated'] == null ? null : DateTime.parse(json['updated']),
      title: json['title'],
      description: json['description'],
      documents:
          json['documents'] == null ? [] : List<String>.from(json['documents']),
      members:
          json['members'] == null ? [] : List<String>.from(json['members']),
      sprint: json['sprint'] == null ? [] : List<String>.from(json['sprint']),
      managers: json['managers'] == null ? [] : List.from(json['managers']),
      starDate:
          json['star_date'] == null ? null : DateTime.parse(json['star_date']),
      endDate:
          json['end_date'] == null ? null : DateTime.parse(json['end_date']),
      progression: json['progression'] ?? '',
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
      'documents': documents,
      'members': members,
      'sprint': sprint,
      'managers': managers,
      'star_date': starDate,
      'end_date': endDate,
      'progression': progression,
    };
  }

  factory ProjectModel.fromEntity(ProjectEntity entity) {
    return ProjectModel(
      id: entity.id,
      collectionId: entity.collectionId,
      collectionName: entity.collectionName,
      created: entity.created,
      updated: entity.updated,
      title: entity.title,
      description: entity.description,
      documents: entity.documents,
      members: entity.members,
      sprint: entity.sprint,
      managers: entity.managers,
      starDate: entity.starDate,
      endDate: entity.endDate,
      progression: entity.progression,
    );
  }
}
