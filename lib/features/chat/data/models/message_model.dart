import '../../domain/entites/message_entity.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    String? id,
    String? collectionId,
    String? collectionName,
    DateTime? created,
    DateTime? updated,
    String? content,
    int? status,
    String? user,
    String? project,
  }) : super(
          id: id,
          collectionId: collectionId,
          collectionName: collectionName,
          created: created,
          updated: updated,
          content: content,
          status: status,
          user: user,
          project: project,
        );
  factory MessageModel.fromEntity(MessageEntity entity) {
    return MessageModel(
      id: entity.id,
      collectionId: entity.collectionId,
      collectionName: entity.collectionName,
      created: entity.created,
      updated: entity.updated,
      content: entity.content,
      status: entity.status,
      user: entity.user,
      project: entity.project,
    );
  }
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: DateTime.parse(json['created']),
      updated: DateTime.parse(json['updated']),
      content: json['content'],
      status: json['status'],
      user: json['user'],
      project: json['project'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created?.toIso8601String(),
      'updated': updated?.toIso8601String(),
      'content': content,
      'status': status,
      'user': user,
      'project': project,
    };
  }
}
