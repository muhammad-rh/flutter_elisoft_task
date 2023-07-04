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
      // Fluttertoast.showToast(
      //   msg: e.toString(),
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.BOTTOM,
      //   timeInSecForIosWeb: 1,
      //   backgroundColor: Colors.redAccent,
      //   textColor: Colors.white,
      //   fontSize: 16.0,
      // );
      return null;
    }
  }
}
