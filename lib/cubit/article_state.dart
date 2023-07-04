part of 'article_cubit.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleError extends ArticleState {
  final String error;
  ArticleError({required this.error});
}

class ArticleLoading extends ArticleState {}

class ArticleFilled extends ArticleState {
  final List<ArticlesModel> article;

  ArticleFilled({required this.article});
}
