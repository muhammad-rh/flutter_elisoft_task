import 'package:bloc/bloc.dart';
import 'package:flutter_elisoft_task/data/models/user_model.dart';
import 'package:flutter_elisoft_task/data/repository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Repository repository;

  AuthCubit({required this.repository}) : super(AuthInitial());

  UserModel? userModel = UserModel();

  void postLogin(String username, String password) {
    emit(AuthLoading());
    repository.postLogin(username, password).then((value) {
      userModel = value;
      emit(AuthFilled());
    }).onError((error, stackTrace) {
      emit(AuthError(error: error.toString()));
    });
  }
}
