import 'package:dio/dio.dart';

class Config {
  static final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3/movie/'),
  )..interceptors.addAll([
    LogInterceptor(requestHeader: true, requestBody: true, error: true),
  ]);
}
