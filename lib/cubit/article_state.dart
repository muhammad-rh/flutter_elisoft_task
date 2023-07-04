part of 'article_cubit.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleFilled extends ArticleState {}
