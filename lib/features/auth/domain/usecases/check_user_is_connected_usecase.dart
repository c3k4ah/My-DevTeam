import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class CheckUserIsConnectedUsecase extends Usecase<bool, NoParams> {
  final AuthRepository repository;

  CheckUserIsConnectedUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    final res = await repository.getToken();
    if (res.isLeft()) return const Left(CacheFailure());
    final token = res.getOrElse(() => '');
    if (token.isEmpty) return const Right(false);

    if (JwtDecoder.isExpired(token)) {
      return const Right(false);
    }
    return const Right(true);
  }
}
