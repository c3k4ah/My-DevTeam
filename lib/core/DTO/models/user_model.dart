import '../entities/user_enetity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String? id,
    required String? collectionId,
    required String? collectionName,
    required String? username,
    required bool? verified,
    required bool? emailVisibility,
    required String? email,
    required DateTime? created,
    required DateTime? updated,
    required String? name,
    required String? avatar,
    required String? tel,
  }) : super(
          id: id,
          collectionId: collectionId,
          collectionName: collectionName,
          username: username,
          verified: verified,
          emailVisibility: emailVisibility,
          email: email,
          created: created,
          updated: updated,
          name: name,
          avatar: avatar,
          tel: tel,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      collectionId: json['collectionId'] ?? '',
      collectionName: json['collectionName'] ?? '',
      username: json['username'] ?? '',
      verified: json['verified'] ?? false,
      emailVisibility: json['emailVisibility'] ?? false,
      email: json['email'] ?? '',
      created: json['created'] != null
          ? DateTime.parse(json['created'].toString())
          : null,
      updated: json['updated'] != null
          ? DateTime.parse(json['updated'].toString())
          : null,
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
      tel: json['tel'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? '',
      'collectionId': collectionId ?? '',
      'collectionName': collectionName ?? '',
      'username': username ?? '',
      'verified': verified ?? false,
      'emailVisibility': emailVisibility ?? false,
      'email': email ?? '',
      'created': created?.toIso8601String(),
      'updated': updated?.toIso8601String(),
      'name': name ?? '',
      'avatar': avatar ?? '',
      'tel': tel ?? '',
    };
  }
}
