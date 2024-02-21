import 'package:pocketbase/pocketbase.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'pocket_base_source.dart';
import 'result.dart';

class PocketBaseSourceImpl implements PocketBaseSource {
  final PocketBase pocketBase;

  PocketBaseSourceImpl(this.pocketBase);

  @override
  Future<Result> delete({
    required String collectionName,
    required String recordId,
  }) async {
    await pocketBase.collection(collectionName).delete(recordId);

    return Result(null);
  }

  @override
  Future<Result> getById({
    required String collectionName,
    required String recordId,
  }) async {
    final result = await pocketBase.collection(collectionName).getOne(recordId);

    return Result(result);
  }

  @override
  Future<Result> create({
    required String collectionName,
    required Map<String, dynamic> body,
    List<http.MultipartFile>? files,
  }) async {
    final result = await pocketBase.collection(collectionName).create(
          body: body,
          files: files ?? [],
        );

    return Result(result);
  }

  @override
  Future<Result> update({
    required String collectionName,
    required String recordId,
    Map<String, dynamic>? body,
    List<http.MultipartFile>? files,
  }) async {
    final result = await pocketBase.collection(collectionName).update(
          recordId,
          body: body ?? {},
          files: files ?? [],
        );

    return Result(result);
  }

  @override
  Future<Result> getAll({
    required String collectionName,
    String? filter,
    String? sort,
    int? limit,
    int? page,
    String? fields,
  }) async {
    final result = await pocketBase.collection(collectionName).getFullList(
          filter: filter,
          sort: sort,
          fields: fields,
        );

    return Result(result);
  }

  @override
  Future<Result> authWithOAuth2({
    required String collectionName,
    required String provider,
  }) async {
    final result = await pocketBase.collection(collectionName).authWithOAuth2(
      provider,
      (url) async {
        await launchUrl(
          url,
        );
      },
    );
    return Result(result);
  }
}
