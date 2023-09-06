class ServerException implements Exception {
  final String? message;
  ServerException({this.message = 'Server error'});
  @override
  String toString() {
    return message ?? 'Server error';
  }
}

class NotFoundException implements Exception {}

class BadRequestException implements Exception {}

class NetworkException implements Exception {}

class UndefinedException implements Exception {}

class CacheException implements Exception {}

class ExpiredSessionException implements Exception {}

class TypeErrorException implements Exception {
  final String? message;
  TypeErrorException({this.message = 'Converting type error'});
  @override
  String toString() {
    return message ?? 'Converting type error';
  }
}
