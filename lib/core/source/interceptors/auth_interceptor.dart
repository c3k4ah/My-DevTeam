import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  // Method to intercept
  //the request before it is sent
  //Or the response before it is received
}
