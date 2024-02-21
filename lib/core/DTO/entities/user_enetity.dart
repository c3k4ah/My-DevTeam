import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? collectionId;
  final String? collectionName;
  final String? username;
  final bool? verified;
  final bool? emailVisibility;
  final String? email;
  final DateTime? created;
  final DateTime? updated;
  final String? name;
  final String? avatar;
  final String? tel;

  const UserEntity({
    this.id,
    this.collectionId,
    this.collectionName,
    this.username,
    this.verified,
    this.emailVisibility,
    this.email,
    this.created,
    this.updated,
    this.name,
    this.avatar,
    this.tel,
  });

  @override
  List<Object?> get props => [
        id,
        collectionId,
        collectionName,
        username,
        verified,
        emailVisibility,
        email,
        created,
        updated,
        name,
        avatar,
        tel,
      ];

  UserEntity copyWith({
    String? id,
    String? collectionId,
    String? collectionName,
    String? username,
    bool? verified,
    bool? emailVisibility,
    String? email,
    DateTime? created,
    DateTime? updated,
    String? name,
    String? avatar,
    String? tel,
  }) {
    return UserEntity(
      id: id ?? this.id,
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      username: username ?? this.username,
      verified: verified ?? this.verified,
      emailVisibility: emailVisibility ?? this.emailVisibility,
      email: email ?? this.email,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      tel: tel ?? this.tel,
    );
  }
}
