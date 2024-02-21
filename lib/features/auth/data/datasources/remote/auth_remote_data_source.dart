import '../../models/auth_model.dart';
import '../../models/location_model.dart';
// import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<AuthModel> loginWithGoogle();

  Future<AuthModel> loginWithFacebook();

  Future<AuthModel> loginWithApple();

  Future<AuthModel> loginWithTelNumber(String telNumber);

  Future<LocationModel> sendLocation(LocationModel locationModel);
}
