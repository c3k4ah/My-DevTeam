import 'package:mydevteam/features/auth/data/models/location_model.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../../../../core/DTO/models/user_model.dart';

import '../../models/auth_model.dart';
import '../../../../../../core/source/remote/pocket_base_source.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final PocketBaseSource pbSource;

  const AuthRemoteDataSourceImpl(this.pbSource);

  @override
  Future<AuthModel> loginWithApple() {
    throw UnimplementedError();
  }

  @override
  Future<AuthModel> loginWithFacebook() async {
    final result = await pbSource.authWithOAuth2(
        collectionName: 'users', provider: 'facebook');
    RecordAuth recordAuth = result.data;

    final authData = AuthModel(
      token: recordAuth.token,
      model: UserModel.fromJson(recordAuth.meta),
    );

    return authData;
  }

  @override
  Future<AuthModel> loginWithGoogle() async {
    final result = await pbSource.authWithOAuth2(
        collectionName: 'users', provider: 'google');
    RecordAuth recordAuth = result.data;

    final authData = AuthModel(
      token: recordAuth.token,
      model: UserModel.fromJson(recordAuth.meta),
    );

    return authData;
  }

  @override
  Future<AuthModel> loginWithTelNumber(String telNumber) {
    throw UnimplementedError();
  }

  @override
  Future<LocationModel> sendLocation(LocationModel locationModel) {
    throw UnimplementedError();
  }
}
