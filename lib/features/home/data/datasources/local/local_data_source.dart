import '../../../../../core/DTO/models/user_model.dart';

abstract class HomeLocalDataSource {
  Future<UserModel> getCachedUser();

  Future<void> deleteUser();
}
