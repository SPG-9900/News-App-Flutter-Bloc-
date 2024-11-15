import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:news/repositories/news_repository.dart';
import 'package:news/blocs/article/article_bloc.dart';
import 'package:news/blocs/article/article_state.dart';
import 'package:news/blocs/article/article_event.dart';
import 'package:news/models/article.dart';

import '../mock.mocks.dart';

@GenerateMocks([NewsRepository])
void main() {
  late ArticleBloc articleBloc;
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    articleBloc = ArticleBloc(newsRepository: mockNewsRepository);
  });

  tearDown(() {
    articleBloc.close();
  });

  group('ArticleBloc', () {
    final testArticle = Article(
      id: '1',
      title: 'Test Title',
      description: 'Test Description',
      content: 'Test Content',
      imageUrl: 'test.jpg',
      category: 'Test Category',
      publishedAt: DateTime.now(),
    );

    test('initial state should be ArticleInitial', () {
      expect(articleBloc.state, isA<ArticleInitial>());
    });

    blocTest<ArticleBloc, ArticleState>(
      'emits [ArticleLoading, ArticleLoaded] when article is successfully loaded',
      build: () {
        when(mockNewsRepository.getArticleById('1'))
            .thenAnswer((_) async => testArticle);
        return articleBloc;
      },
      act: (bloc) => bloc.add(const LoadArticle('1')),
      expect: () => [
        isA<ArticleLoading>(),
        isA<ArticleLoaded>().having(
          (state) => state.article,
          'article',
          equals(testArticle),
        ),
      ],
    );

    blocTest<ArticleBloc, ArticleState>(
      'emits [ArticleLoading, ArticleError] when loading fails',
      build: () {
        when(mockNewsRepository.getArticleById('1'))
            .thenThrow(Exception('Failed to load article'));
        return articleBloc;
      },
      act: (bloc) => bloc.add(const LoadArticle('1')),
      expect: () => [
        isA<ArticleLoading>(),
        isA<ArticleError>().having(
          (state) => state.message,
          'error message',
          contains('Failed to load article'),
        ),
      ],
    );
  });
}
