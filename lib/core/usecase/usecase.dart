import 'package:dartz/dartz.dart';

import '../error/failure.dart';

/// T : Value returned by the usecase
///
/// P : Parameters passed to the usecase
abstract class Usecase<T, P> {
  Future<Either<Failure, T?>> call(P params);
}

class NoParams {}

// user for streams
abstract class StreamUsecase<T, P> {
  Stream<Either<Failure, T?>> call(P params);
}
