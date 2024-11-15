import 'package:mockito/annotations.dart';
import 'package:news/repositories/news_repository.dart';
import 'package:news/blocs/article/article_bloc.dart';
import 'package:news/blocs/category/category_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([NewsRepository, SharedPreferences, ArticleBloc, CategoryBloc])
void main() {}
