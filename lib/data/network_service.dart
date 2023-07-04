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
      print('responseData : ${response.data}');

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (e) {
      print('error ${e.response}');
      return null;
    }
  }

  getArticle() async {
    try {
      final response = await _api.dio.get('/articles');
      print('responseData : ${response.data}');

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (e) {
      print('error ${e.response}');
      return null;
    }
  }
}
