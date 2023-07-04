import 'package:dio/dio.dart';
import 'package:flutter_elisoft_task/constant/api.dart';

class NetworkService {
  final API _api = API();

  postLogin(Map<String, String> body) async {
    try {
      final response = await _api.dio.post(
        '/auth/login',
        data: body,
      );

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (e) {
      return e;
    }
  }

  getArticle() async {
    try {
      final response = await _api.dio.get(
        '/articles',
      );

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (e) {
      return e;
    }
  }
}
