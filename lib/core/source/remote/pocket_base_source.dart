import 'package:http/http.dart' as http;

import 'result.dart';

abstract class PocketBaseSource {
  Future<Result> delete({
    required String collectionName,
    required String recordId,
  });

  Future<Result> getById({
    required String collectionName,
    required String recordId,
  });

  Future<Result> getAll({
    required String collectionName,
    String? filter,
    String? fields,
    String? sort,
    int? limit,
    int? page,
  });

  Future<Result> create({
    required String collectionName,
    required Map<String, dynamic> body,
    List<http.MultipartFile>? files,
  });

  Future<Result> update({
    required String collectionName,
    required String recordId,
    Map<String, dynamic>? body,
    List<http.MultipartFile>? files,
  });

  Future<Result> authWithOAuth2({
    required String collectionName,
    required String provider,
  });
}
