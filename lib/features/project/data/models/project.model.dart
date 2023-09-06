import '../../domain/domaine.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required String id,
    required String name,
    required String description,
    required String image,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<String> memberIds,
    required List<String> taskIds,
  }) : super(
          id: id,
          name: name,
          description: description,
          image: image,
          createdAt: createdAt,
          updatedAt: updatedAt,
          memberIds: memberIds,
          taskIds: taskIds,
        );

  factory ProjectModel.fromEntity(ProjectEntity entity) {
    return ProjectModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      image: entity.image,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      memberIds: entity.memberIds,
      taskIds: entity.taskIds,
    );
  }

  ProjectEntity toEntity() {
    return ProjectEntity(
      id: id,
      name: name,
      description: description,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
      memberIds: memberIds,
      taskIds: taskIds,
    );
  }

  factory ProjectModel.fromMap(Map<String, Object?> map) {
    return ProjectModel(
      id: map['id']! as String,
      name: map['name']! as String,
      description: map['description']! as String,
      image: map['image']! as String,
      createdAt: DateTime.parse(map['createdAt']! as String),
      updatedAt: DateTime.parse(map['updatedAt']! as String),
      memberIds: (map['memberIds']! as List<Object?>)
          .map((e) => e! as String)
          .toList(),
      taskIds:
          (map['taskIds']! as List<Object?>).map((e) => e! as String).toList(),
    );
  }

  factory ProjectModel.fromJson(Map<String, Object?> json) {
    return ProjectModel(
      id: json['id']! as String,
      name: json['name']! as String,
      description: json['description']! as String,
      image: json['image']! as String,
      createdAt: DateTime.parse(json['createdAt']! as String),
      updatedAt: DateTime.parse(json['updatedAt']! as String),
      memberIds: (json['memberIds']! as List<Object?>)
          .map((e) => e! as String)
          .toList(),
      taskIds:
          (json['taskIds']! as List<Object?>).map((e) => e! as String).toList(),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'memberIds': memberIds,
      'taskIds': taskIds,
    };
  }

  ProjectModel copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? memberIds,
    List<String>? taskIds,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      memberIds: memberIds ?? this.memberIds,
      taskIds: taskIds ?? this.taskIds,
    );
  }
}
