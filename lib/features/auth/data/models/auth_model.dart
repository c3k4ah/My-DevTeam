import '../../../../../core/DTO/models/user_model.dart';

class AuthModel {
  final String token;
  final UserModel model;

  const AuthModel({
    required this.token,
    required this.model,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'] ?? '',
      model: UserModel.fromJson(json['model'] ?? {}),
    );
  }

  @override
  String toString() => 'AuthModel(meta: ${model.email}, token: $token,)';
}
