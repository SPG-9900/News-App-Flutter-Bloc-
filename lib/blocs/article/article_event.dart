import 'package:equatable/equatable.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object?> get props => [];
}

class LoadArticle extends ArticleEvent {
  final String articleId;

  const LoadArticle(this.articleId);

  @override
  List<Object?> get props => [articleId];
}
