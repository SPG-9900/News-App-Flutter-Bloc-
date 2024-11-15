import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repositories/news_repository.dart';
import '../../blocs/theme/theme_bloc.dart';
import '../../blocs/home/home_bloc.dart';
import '../../blocs/category/category_bloc.dart';
import '../../blocs/article/article_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerLazySingleton<NewsRepository>(() => NewsRepository());

  getIt.registerFactory(() => ThemeBloc(prefs: getIt()));
  getIt.registerFactory(() => HomeBloc(newsRepository: getIt()));
  getIt.registerFactory(() => CategoryBloc(newsRepository: getIt()));
  getIt.registerFactory(() => ArticleBloc(newsRepository: getIt()));
}
