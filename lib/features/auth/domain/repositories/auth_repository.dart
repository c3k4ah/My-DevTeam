import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/DTO/entities/user_enetity.dart';
import '../entities/location_entity.dart';
import '../entities/login_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> loginUser(LoginParams loginParams);

  Future<Either<Failure, bool>> cachedUser(UserEntity registerParams);

  Future<Either<Failure, bool>> checkIfUserCached();

  Future<Either<Failure, UserEntity>> getCachedUser();

  Future<Either<Failure, void>> logOut();

  Future<Either<Failure, String>> getToken();

  Future<Either<Failure, UserEntity>> loginWithGoogle();

  Future<Either<Failure, UserEntity>> loginWithFacebook();

  Future<Either<Failure, UserEntity>> loginWithApple();

  Future<Either<Failure, UserEntity>> loginWithTelNumber(String telNumber);

  Future<Either<Failure, LocationEntity>> sendLocation(
    LocationEntity locationEntity,
  );
}
