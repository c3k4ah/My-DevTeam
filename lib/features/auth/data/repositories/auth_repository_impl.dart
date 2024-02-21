// ignore_for_file: unused_import

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:mydevteam/features/auth/domain/entities/location_entity.dart';
import '../../../../../../core/networks/network.dart';

import '../../../../../core/DTO/entities/user_enetity.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/log.dart';
import '../../../../../core/utils/multiparte_file.dart';
import '../../domain/domain.dart';
import '../../domain/entities/login_params.dart';
import '../datasources/local/auth_local_data_source.dart';
import '../datasources/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource local;
  final AuthRemoteDataSource remote;

  final ConnexionChecker networkInfo;

  AuthRepositoryImpl(
    this.local,
    this.remote,
    this.networkInfo,
  );

  @override
  Future<Either<Failure, bool>> checkIfUserCached() async {
    try {
      final result = await local.isUserCached();
      return Right(result);
    } catch (e) {
      Log.error(e);
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await local.deleteUser();
      return Future.value(const Right(null));
    } catch (e) {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser(LoginParams loginParams) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> getCachedUser() async {
    try {
      final result = await local.getCachedUser();
      return Right(result);
    } catch (e) {
      Log.error(e);
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> cachedUser(UserEntity registerParams) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    try {
      final result = await local.getToken();
      return Right(result);
    } catch (e) {
      Log.error(e);
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithApple() async {
    try {
      // final result = await remote.loginWithApple();
      return const Right(UserEntity());
    } catch (e) {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    try {
      final result = await remote.loginWithFacebook();
      return Right(result.model);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final result = await remote.loginWithGoogle();
      // await local.saveUser(result.model);
      // await local.saveToken(result.token);
      return Right(result.model);
    } catch (e) {
      Log.error(e);
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithTelNumber(String telNumber) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, LocationEntity>> sendLocation(
      LocationEntity locationEntity) {
    throw UnimplementedError();
  }
}
