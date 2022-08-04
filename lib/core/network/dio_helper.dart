import 'package:dio/dio.dart';

class DioHelper {
  static const baseUrl = 'https://api.thecatapi.com/v1';
  static const filesPath = '/files/';
  static const timeout = 30000;

  static Dio getDio() {
    return Dio()
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ))
      ..options.receiveDataWhenStatusError = true
      ..options.baseUrl = baseUrl
      ..options.sendTimeout = timeout
      ..options.connectTimeout = timeout
      ..options.receiveTimeout = timeout;
  }
}
