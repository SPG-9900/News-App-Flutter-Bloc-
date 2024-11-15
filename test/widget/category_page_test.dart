import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:news/blocs/category/category_state.dart';
import 'package:news/screens/category/category_page.dart';
import 'package:news/blocs/category/category_bloc.dart';
import 'package:news/models/article.dart';

import '../mock.mocks.dart';

void main() {
  late MockCategoryBloc mockCategoryBloc;

  setUp(() {
    mockCategoryBloc = MockCategoryBloc();
  });

  testWidgets('CategoryPage shows loading indicator initially',
      (WidgetTester tester) async {
    when(mockCategoryBloc.state).thenReturn(CategoryLoading());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CategoryBloc>.value(
          value: mockCategoryBloc,
          child: const CategoryPage(category: 'Technology'),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('CategoryPage shows articles when loaded',
      (WidgetTester tester) async {
    final testArticles = [
      Article(
        id: '1',
        title: 'Test Title',
        description: 'Test Description',
        content: 'Test Content',
        imageUrl: 'test.jpg',
        category: 'Technology',
        publishedAt: DateTime.now(),
      ),
    ];

    when(mockCategoryBloc.state).thenReturn(
        CategoryLoaded(articles: testArticles, category: 'Technology'));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CategoryBloc>.value(
          value: mockCategoryBloc,
          child: const CategoryPage(category: 'Technology'),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Description'), findsOneWidget);
  });
}
