import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({this.message, this.code});

  final String? message;
  final int? code;

  @override
  List<Object?> get props => [message, code];
}

class ServerFailure extends Failure {
  final String? info;

  const ServerFailure({this.info})
      : super(message: info ?? 'Server error', code: 500);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({String? message, int? code})
      : super(message: message ?? 'Bad request', code: 400);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({String? message, int? code})
      : super(message: message ?? 'Unauthorized', code: 401);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure() : super(message: 'Not found', code: 404);
}

class CacheFailure extends Failure {
  const CacheFailure() : super(message: 'Cache error');
}

class ExpiredSessionFailure extends Failure {
  const ExpiredSessionFailure() : super(message: 'Session expired');
}

class NoConnexionFailure extends Failure {
  const NoConnexionFailure({String? message, int? code})
      : super(
          message: 'Pas d\'accès internet',
          code: 00,
        );
}

class TypeErrorFailure extends Failure {
  final String? info;

  const TypeErrorFailure({this.info})
      : super(message: info ?? 'Converting type error');
}

class LocationFailure extends Failure {
  const LocationFailure({super.message});
}
