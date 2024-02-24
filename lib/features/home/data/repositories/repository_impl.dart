import 'package:dartz/dartz.dart';

import 'package:mydevteam/core/DTO/entities/user_enetity.dart';

import 'package:mydevteam/core/error/failure.dart';

import '../../domain/repositories/repository.dart';
import '../datasources/local/local_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource local;

  HomeRepositoryImpl(this.local);

  @override
  Future<Either<Failure, void>> deleteUser() async {
    try {
      final result = await local.deleteUser();
      return Right(result);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCachedUser() async {
    try {
      final result = await local.getCachedUser();
      return Right(result);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }
}
