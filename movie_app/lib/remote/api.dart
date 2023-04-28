import 'package:dio/dio.dart';
import 'package:movie_app/remote/config.dart';
import 'package:movie_app/models/Movies.dart';

import 'constant.dart';

class ApiService {
  ApiService._();
  static final ApiService api = ApiService._();

  Future<movies> fetchdata() async {
    final dio = Config.getDio();
    final url = 'popular';
    final response = await dio.get(
      url,
      queryParameters: {'api_key': apikey},
    );
    if (response.statusCode == 200) {
      return movies.fromJson(response.data);
    } else {
      throw Exception('Unable to fetch data');
    }
  }
}
