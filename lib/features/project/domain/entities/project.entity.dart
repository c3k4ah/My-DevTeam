import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  const ProjectEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.memberIds,
    required this.taskIds,
  });

  final int id;
  final String name;
  final String description;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> memberIds;
  final List<String> taskIds;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
        createdAt,
        updatedAt,
        memberIds,
        taskIds,
      ];
}
