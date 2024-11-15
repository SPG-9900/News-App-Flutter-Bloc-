import 'package:go_router/go_router.dart';
import '../screens/home/home_page.dart';
import '../screens/category/category_page.dart';
import '../screens/article/article_detail_page.dart';
import '../screens/settings/settings_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/category/:categoryName',
        builder: (context, state) {
          final categoryName = state.pathParameters['categoryName']!;
          return CategoryPage(category: categoryName);
        },
      ),
      GoRoute(
        path: '/article/:articleId',
        builder: (context, state) {
          final articleId = state.pathParameters['articleId']!;
          return ArticleDetailPage(articleId: articleId);
        },
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}
