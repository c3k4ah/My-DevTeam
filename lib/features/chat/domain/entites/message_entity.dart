import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String? id;
  final String? collectionId;
  final String? collectionName;
  final DateTime? created;
  final DateTime? updated;
  final String? content;
  final int? status;
  final String? user;
  final String? project;

  const MessageEntity({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.content,
    this.status,
    this.user,
    this.project,
  });

  MessageEntity copyWith({
    String? id,
    String? collectionId,
    String? collectionName,
    DateTime? created,
    DateTime? updated,
    String? content,
    int? status,
    String? user,
    String? project,
  }) {
    return MessageEntity(
      id: id ?? this.id,
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      content: content ?? this.content,
      status: status ?? this.status,
      user: user ?? this.user,
      project: project ?? this.project,
    );
  }

  @override
  List<Object?> get props => [
        id,
        collectionId,
        collectionName,
        created,
        updated,
        content,
        status,
        user,
        project,
      ];
}
