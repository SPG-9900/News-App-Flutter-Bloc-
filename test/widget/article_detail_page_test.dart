import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:news/blocs/article/article_state.dart';
import 'package:news/screens/article/article_detail_page.dart';
import 'package:news/blocs/article/article_bloc.dart';
import 'package:news/models/article.dart';

import '../mock.mocks.dart';

void main() {
  late MockArticleBloc mockArticleBloc;

  setUp(() {
    mockArticleBloc = MockArticleBloc();
  });

  testWidgets('ArticleDetailPage shows loading indicator initially',
      (WidgetTester tester) async {
    when(mockArticleBloc.state).thenReturn(ArticleLoading());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ArticleBloc>.value(
          value: mockArticleBloc,
          child: const ArticleDetailPage(articleId: '1'),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('ArticleDetailPage shows article content when loaded',
      (WidgetTester tester) async {
    final testArticle = Article(
      id: '1',
      title: 'Test Title',
      description: 'Test Description',
      content: 'Test Content',
      imageUrl: 'test.jpg',
      category: 'Test Category',
      publishedAt: DateTime.now(),
    );

    when(mockArticleBloc.state).thenReturn(ArticleLoaded(testArticle));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ArticleBloc>.value(
          value: mockArticleBloc,
          child: const ArticleDetailPage(articleId: '1'),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Description'), findsOneWidget);
    expect(find.text('Test Content'), findsOneWidget);
  });
}
