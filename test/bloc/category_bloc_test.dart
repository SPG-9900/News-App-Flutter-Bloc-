import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:news/repositories/news_repository.dart';
import 'package:news/blocs/category/category_bloc.dart';
import 'package:news/blocs/category/category_state.dart';
import 'package:news/blocs/category/category_event.dart';
import 'package:news/models/article.dart';

import '../mock.mocks.dart';

@GenerateMocks([NewsRepository])
void main() {
  late CategoryBloc categoryBloc;
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    categoryBloc = CategoryBloc(newsRepository: mockNewsRepository);
  });

  tearDown(() {
    categoryBloc.close();
  });

  group('CategoryBloc', () {
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

    test('initial state should be CategoryInitial', () {
      expect(categoryBloc.state, isA<CategoryInitial>());
    });

    blocTest<CategoryBloc, CategoryState>(
      'emits [CategoryLoading, CategoryLoaded] when articles are successfully loaded',
      build: () {
        when(mockNewsRepository.getArticlesByCategory('Technology'))
            .thenAnswer((_) async => testArticles);
        return categoryBloc;
      },
      act: (bloc) => bloc.add(const LoadCategoryArticles('Technology')),
      expect: () => [
        isA<CategoryLoading>(),
        isA<CategoryLoaded>().having(
          (state) => state.articles,
          'articles',
          equals(testArticles),
        ),
      ],
    );

    blocTest<CategoryBloc, CategoryState>(
      'emits [CategoryLoading, CategoryError] when loading fails',
      build: () {
        when(mockNewsRepository.getArticlesByCategory('Technology'))
            .thenThrow(Exception('Failed to load articles'));
        return categoryBloc;
      },
      act: (bloc) => bloc.add(const LoadCategoryArticles('Technology')),
      expect: () => [
        isA<CategoryLoading>(),
        isA<CategoryError>().having(
          (state) => state.message,
          'error message',
          contains('Failed to load articles'),
        ),
      ],
    );
  });
}
