import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/news_repository.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final NewsRepository newsRepository;

  CategoryBloc({required this.newsRepository}) : super(CategoryInitial()) {
    on<LoadCategoryArticles>(_onLoadCategoryArticles);
  }

  Future<void> _onLoadCategoryArticles(
    LoadCategoryArticles event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    try {
      final articles =
          await newsRepository.getArticlesByCategory(event.category);
      emit(CategoryLoaded(articles: articles, category: event.category));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
