import 'package:dartz/dartz.dart';

import '../../../../core/DTO/entities/user_enetity.dart';
import '../../../../core/error/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, UserEntity>> getCachedUser();

  Future<Either<Failure, void>> deleteUser();
}
