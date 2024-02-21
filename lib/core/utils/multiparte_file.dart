import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

http.MultipartFile multipartFile(
  String field,
  String pathImage,
) {
  return http.MultipartFile.fromBytes(
    field,
    File(pathImage).readAsBytesSync(),
    filename: pathImage.split('/').last,
    contentType: MediaType(
      'image',
      path.extension(pathImage).replaceFirst('.', ''),
    ),
  );
}
