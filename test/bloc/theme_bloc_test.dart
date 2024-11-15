import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news/blocs/theme/theme_bloc.dart';
import 'package:news/blocs/theme/theme_state.dart';
import 'package:news/blocs/theme/theme_event.dart';

import 'theme_bloc_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late ThemeBloc themeBloc;
  late MockSharedPreferences mockPrefs;

  setUp(() {
    mockPrefs = MockSharedPreferences();
    when(mockPrefs.getBool('isDark')).thenReturn(false);
    themeBloc = ThemeBloc(prefs: mockPrefs);
  });

  tearDown(() {
    themeBloc.close();
  });

  group('ThemeBloc', () {
    test('initial state should have isDark false when preference is false', () {
      expect(themeBloc.state.isDark, isFalse);
    });

    blocTest<ThemeBloc, ThemeState>(
      'emits new state with toggled theme when ToggleTheme is added',
      build: () {
        when(mockPrefs.setBool('isDark', true)).thenAnswer((_) async => true);
        return themeBloc;
      },
      act: (bloc) => bloc.add(ToggleTheme()),
      expect: () => [
        isA<ThemeState>().having(
          (state) => state.isDark,
          'isDark',
          isTrue,
        ),
      ],
    );
  });
}
