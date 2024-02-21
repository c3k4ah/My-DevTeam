import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/DTO/models/user_model.dart';
import '../../../../../../core/constants/shared_preference_key.dart';
import '../../models/auth_model.dart';
import 'auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences preference;

  AuthLocalDataSourceImpl(this.preference);

  @override
  Future<bool> saveUser(user) async {
    await preference.setString(
        SharedPreferenceKey.user, jsonEncode(user.toJson()));
    return Future.value(true);
  }

  @override
  Future<bool> deleteUser() {
    throw UnimplementedError();
  }

  @override
  Future<String> getToken() async {
    final authData = preference.getString(SharedPreferenceKey.pbAuth);
    final token =
        authData != null ? AuthModel.fromJson(jsonDecode(authData)).token : '';
    return Future.value(token);
  }

  @override
  Future<bool> isUserCached() async {
    final authData = preference.getString(SharedPreferenceKey.pbAuth);

    return Future.value(authData != null);
  }

  @override
  Future<void> saveToken(String token) async {
    await preference.setString(SharedPreferenceKey.token, token);
    return Future.value(null);
  }

  @override
  Future<UserModel> getCachedUser() {
    final authData = preference.getString(SharedPreferenceKey.pbAuth) ?? '';
    final user = AuthModel.fromJson(jsonDecode(authData)).model;
    return Future.value(user);
  }
}
