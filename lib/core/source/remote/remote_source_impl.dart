import 'package:dio/dio.dart';

import 'remote_source.dart';
import 'result.dart';

class RemoteSourceImpl implements RemoteSource {
  final Dio dio;

  RemoteSourceImpl(this.dio);

  @override
  Future<Result> delete(
    String url, {
    body,
    Map<String, dynamic>? headers,
  }) async {
    Response res = await dio.delete(
      url,
      data: body,
      options: Options(
        headers: headers,
      ),
    );
    return Result(res.data);
  }

  @override
  Future<Result> get(
    String url, {
    Map<String, String>? params,
    Map<String, dynamic>? headers,
  }) async {
    Response res = await dio.get(
      url,
      queryParameters: params,
      options: Options(
        headers: headers,
      ),
    );
    return Result(res.data);
  }

  @override
  Future<Result> post(
    String url, {
    body,
    Map<String, dynamic>? headers,
  }) async {
    Response res = await dio.post(
      url,
      data: body,
      options: Options(
        headers: headers,
      ),
    );
    return Result(res.data);
  }

  @override
  Future<Result> put(
    String url, {
    body,
    Map<String, dynamic>? headers,
  }) async {
    Response res = await dio.put(
      url,
      data: body,
      options: Options(
        headers: headers,
      ),
    );
    return Result(res.data);
  }
}
