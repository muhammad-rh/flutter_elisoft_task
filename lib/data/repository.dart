import 'package:flutter_elisoft_task/data/models/user_model.dart';
import 'package:flutter_elisoft_task/data/network_service.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});

  Future<UserModel> postLogin(String username, String password) async {
    final body = {
      'email': username,
      'password': password,
      // 'token': '',
    };

    final response = await networkService.postLogin(body);

    ResponseResultUserModel responseResult =
        ResponseResultUserModel.fromJson(response);

    return responseResult.user!;
  }
}
