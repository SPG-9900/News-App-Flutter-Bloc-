import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/news_repository.dart';
import 'article_event.dart';
import 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final NewsRepository newsRepository;

  ArticleBloc({required this.newsRepository}) : super(ArticleInitial()) {
    on<LoadArticle>(_onLoadArticle);
  }

  Future<void> _onLoadArticle(
      LoadArticle event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());
    try {
      final article = await newsRepository.getArticleById(event.articleId);
      if (article != null) {
        emit(ArticleLoaded(article));
      } else {
        emit(const ArticleError('Article not found'));
      }
    } catch (e) {
      emit(ArticleError(e.toString()));
    }
  }
}
