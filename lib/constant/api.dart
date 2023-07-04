import 'package:dio/dio.dart';
import 'package:flutter_elisoft_task/constant/strings.dart';

class API {
  final Dio dio;
  static final API _api = API._internal(
    Dio(
      BaseOptions(
        baseUrl: 'https://demo.treblle.com/api/v1',
        headers: {
          'Authorization': 'Bearer $TOKEN',
        },
      ),
    ),
  );

  factory API() => _api;
  API._internal(this.dio);
}
