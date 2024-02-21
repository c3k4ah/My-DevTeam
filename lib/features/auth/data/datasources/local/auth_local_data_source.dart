import '../../../../../../core/DTO/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<bool> saveUser(UserModel user);

  Future<UserModel> getCachedUser();

  Future<bool> deleteUser();

  Future<bool> isUserCached();

  Future<void> saveToken(String token);

  Future<String> getToken();
}
