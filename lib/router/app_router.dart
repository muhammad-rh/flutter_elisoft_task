import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elisoft_task/cubit/article_cubit.dart';
import 'package:flutter_elisoft_task/cubit/auth_cubit.dart';
import 'package:flutter_elisoft_task/data/network_service.dart';
import 'package:flutter_elisoft_task/data/repository.dart';
import 'package:flutter_elisoft_task/view/article_view.dart';
import 'package:flutter_elisoft_task/view/login_view.dart';

class AppRouter {
  late Repository repository;
  late AuthCubit authCubit;
  late ArticleCubit articleCubit;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
    authCubit = AuthCubit(repository: repository);
    articleCubit = ArticleCubit(repository: repository);
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const LoginView(),
          ),
        );
      case '/article-view':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: articleCubit,
              ),
              BlocProvider.value(
                value: authCubit,
              ),
            ],
            child: const ArticleView(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
