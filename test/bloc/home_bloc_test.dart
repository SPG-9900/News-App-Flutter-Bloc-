import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:news/repositories/news_repository.dart';
import 'package:news/blocs/home/home_bloc.dart';
import 'package:news/blocs/home/home_state.dart';
import 'package:news/blocs/home/home_event.dart';
import 'package:news/models/article.dart';

import '../mock.mocks.dart';

@GenerateMocks([NewsRepository])
void main() {
  late HomeBloc homeBloc;
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    homeBloc = HomeBloc(newsRepository: mockNewsRepository);
  });

  tearDown(() {
    homeBloc.close();
  });

  group('HomeBloc', () {
    final testArticles = [
      Article(
        id: '1',
        title: 'Test Title 1',
        description: 'Test Description 1',
        content: 'Test Content 1',
        imageUrl: 'test1.jpg',
        category: 'Technology',
        publishedAt: DateTime.now(),
      ),
      Article(
        id: '2',
        title: 'Test Title 2',
        description: 'Test Description 2',
        content: 'Test Content 2',
        imageUrl: 'test2.jpg',
        category: 'Health',
        publishedAt: DateTime.now(),
      ),
    ];

    test('initial state should be HomeInitial', () {
      expect(homeBloc.state, isA<HomeInitial>());
    });

    blocTest<HomeBloc, HomeState>(
      'emits [HomeLoading, HomeLoaded] when categories are successfully loaded',
      build: () {
        when(mockNewsRepository.getArticles())
            .thenAnswer((_) async => testArticles);
        return homeBloc;
      },
      act: (bloc) => bloc.add(LoadCategories()),
      expect: () => [
        isA<HomeLoading>(),
        isA<HomeLoaded>().having(
          (state) => state.categories,
          'categories',
          equals(['Technology', 'Health']),
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [HomeLoading, HomeError] when loading fails',
      build: () {
        when(mockNewsRepository.getArticles())
            .thenThrow(Exception('Failed to load categories'));
        return homeBloc;
      },
      act: (bloc) => bloc.add(LoadCategories()),
      expect: () => [
        isA<HomeLoading>(),
        isA<HomeError>().having(
          (state) => state.message,
          'error message',
          contains('Failed to load categories'),
        ),
      ],
    );
  });
}
