import 'dart:convert';

import 'package:mydevteam/core/DTO/models/user_model.dart';
import 'package:mydevteam/features/home/data/datasources/local/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/shared_preference_key.dart';
import '../../../../auth/data/models/auth_model.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final SharedPreferences sharedPreferences;

  HomeLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> deleteUser() async {
    await sharedPreferences.clear();
  }

  @override
  Future<UserModel> getCachedUser() async {
    final authData =
        sharedPreferences.getString(SharedPreferenceKey.pbAuth) ?? '';
    final user = AuthModel.fromJson(jsonDecode(authData)).model;
    return user;
  }
}
