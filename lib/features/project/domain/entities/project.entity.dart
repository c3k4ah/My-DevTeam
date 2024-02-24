import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  const ProjectEntity({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.title,
    this.description,
    this.documents,
    this.members,
    this.sprint,
    this.managers,
    this.starDate,
    this.endDate,
    this.progression,
  });

  final String? id;
  final String? collectionId;
  final String? collectionName;
  final DateTime? created;
  final DateTime? updated;
  final String? title;
  final String? description;
  final List<String>? documents;
  final List<String>? members;
  final List<String>? sprint;
  final List<String>? managers;
  final DateTime? starDate;
  final DateTime? endDate;
  final int? progression;

  ProjectEntity copyWith({
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
    int? progression,
  }) {
    return ProjectEntity(
      id: id ?? this.id,
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      title: title ?? this.title,
      description: description ?? this.description,
      documents: documents ?? this.documents,
      members: members ?? this.members,
      sprint: sprint ?? this.sprint,
      managers: managers ?? this.managers,
      starDate: starDate ?? this.starDate,
      endDate: endDate ?? this.endDate,
      progression: progression ?? this.progression,
    );
  }

  @override
  List<Object?> get props => [
        id,
        collectionId,
        collectionName,
        created,
        updated,
        title,
        description,
        documents,
        members,
        sprint,
        managers,
        starDate,
        endDate,
        progression,
      ];
}
