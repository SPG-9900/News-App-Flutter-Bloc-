import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/news_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final NewsRepository newsRepository;

  HomeBloc({required this.newsRepository}) : super(HomeInitial()) {
    on<LoadCategories>(_onLoadCategories);
  }

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final articles = await newsRepository.getArticles();
      final categories = articles.map((a) => a.category).toSet().toList();
      emit(HomeLoaded(categories));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
