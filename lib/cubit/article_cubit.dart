import 'package:bloc/bloc.dart';
import 'package:flutter_elisoft_task/data/repository.dart';
import 'package:meta/meta.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final Repository repository;

  ArticleCubit({required this.repository}) : super(ArticleInitial());

  void getArticle() {}
}
