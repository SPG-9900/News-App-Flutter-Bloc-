import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:go_router/go_router.dart';
import 'package:news/screens/home/home_page.dart';
import 'package:news/blocs/home/home_bloc.dart';
import 'package:news/blocs/home/home_state.dart';
import 'package:news/blocs/home/home_event.dart';
import 'package:news/widgets/loading_indicator.dart';

@GenerateMocks([HomeBloc, GoRouter])
void main() {
  late MockHomeBloc mockHomeBloc;
  late MockGoRouter mockGoRouter;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    mockGoRouter = MockGoRouter();

    // Setup default state
    when(mockHomeBloc.state).thenReturn(HomeInitial());
    when(mockHomeBloc.stream).thenAnswer((_) => Stream.empty());
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: InheritedGoRouter(
        goRouter: mockGoRouter,
        child: BlocProvider<HomeBloc>.value(
          value: mockHomeBloc,
          child: const HomePage(),
        ),
      ),
    );
  }

  group('HomePage Widget Tests', () {
    testWidgets('should show AppBar with correct title', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('News Categories'), findsOneWidget);
    });

    testWidgets('should show settings icon in AppBar', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets('should navigate to settings page when settings icon is tapped',
        (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      verify(mockGoRouter.push('/settings')).called(1);
    });

    testWidgets('should show LoadingIndicator when state is HomeLoading',
        (tester) async {
      when(mockHomeBloc.state).thenReturn(HomeLoading());

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(LoadingIndicator), findsOneWidget);
      expect(find.byType(ListView), findsNothing);
    });

    testWidgets('should show categories list when state is HomeLoaded',
        (tester) async {
      final categories = ['Technology', 'Health', 'Sports'];
      when(mockHomeBloc.state).thenReturn(HomeLoaded(categories));

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(LoadingIndicator), findsNothing);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(Card), findsNWidgets(categories.length));

      // Verify all category names are displayed
      for (final category in categories) {
        expect(find.text(category), findsOneWidget);
      }
    });

    testWidgets('should show error message when state is HomeError',
        (tester) async {
      const errorMessage = 'Failed to load categories';
      when(mockHomeBloc.state).thenReturn(const HomeError(errorMessage));

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(LoadingIndicator), findsNothing);
      expect(find.byType(ListView), findsNothing);
      expect(find.text(errorMessage), findsOneWidget);
    });

    testWidgets('should navigate to category page when category is tapped',
        (tester) async {
      final categories = ['Technology'];
      when(mockHomeBloc.state).thenReturn(HomeLoaded(categories));

      await tester.pumpWidget(createWidgetUnderTest());

      await tester.tap(find.text('Technology'));
      await tester.pumpAndSettle();

      verify(mockGoRouter.push('/category/Technology')).called(1);
    });

    testWidgets('should trigger LoadCategories event when built',
        (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      verify(mockHomeBloc.add(LoadCategories())).called(1);
    });

    testWidgets('should show empty container for HomeInitial state',
        (tester) async {
      when(mockHomeBloc.state).thenReturn(HomeInitial());

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(LoadingIndicator), findsNothing);
      expect(find.byType(ListView), findsNothing);
    });

    testWidgets('should handle empty categories list', (tester) async {
      when(mockHomeBloc.state).thenReturn(const HomeLoaded([]));

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(Card), findsNothing);
    });

    testWidgets('should maintain scroll position when rebuilding',
        (tester) async {
      // Create a long list of categories
      final categories = List.generate(20, (index) => 'Category $index');
      when(mockHomeBloc.state).thenReturn(HomeLoaded(categories));

      await tester.pumpWidget(createWidgetUnderTest());

      // Scroll down
      await tester.drag(find.byType(ListView), const Offset(0, -500));
      await tester.pump();

      // Verify some items are not visible
      expect(find.text('Category 0'), findsNothing);

      // Trigger rebuild
      await tester.pump();

      // Verify scroll position is maintained
      expect(find.text('Category 0'), findsNothing);
    });
  });
}

// Mock class implementations
class MockHomeBloc extends Mock implements HomeBloc {
  @override
  Stream<HomeState> get stream => super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: Stream.empty(),
      ) as Stream<HomeState>;

  @override
  HomeState get state => super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: HomeInitial(),
      ) as HomeState;
}

class MockGoRouter extends Mock implements GoRouter {}
