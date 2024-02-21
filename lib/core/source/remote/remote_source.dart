import 'result.dart';

abstract class RemoteSource {
  Future<Result> get(
    String url, {
    Map<String, String>? params,
    Map<String, dynamic>? headers,
  });

  Future<Result> post(
    String url, {
    dynamic body,
    Map<String, dynamic>? headers,
  });

  Future<Result> put(
    String url, {
    dynamic body,
    Map<String, dynamic>? headers,
  });

  Future<Result> delete(
    String url, {
    dynamic body,
    Map<String, dynamic>? headers,
  });
}
