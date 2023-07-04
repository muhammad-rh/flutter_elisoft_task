import 'package:bloc/bloc.dart';
import 'package:flutter_elisoft_task/data/models/article_model.dart';
import 'package:flutter_elisoft_task/data/repository.dart';
import 'package:meta/meta.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final Repository repository;

  ArticleCubit({required this.repository}) : super(ArticleInitial());

  void getArticle() {
    emit(ArticleLoading());
    repository.getArticle().then((value) {
      emit(ArticleFilled(article: value));
    }).onError((error, stackTrace) {
      emit(ArticleError(error: error.toString()));
    });
  }
}
