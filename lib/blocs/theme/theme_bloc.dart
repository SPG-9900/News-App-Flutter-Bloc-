import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences prefs;
  static const String _themeKey = 'isDark';

  ThemeBloc({required this.prefs})
      : super(ThemeState(isDark: prefs.getBool(_themeKey) ?? false)) {
    on<ToggleTheme>(_onToggleTheme);
  }

  Future<void> _onToggleTheme(
    ToggleTheme event,
    Emitter<ThemeState> emit,
  ) async {
    final newIsDark = !state.isDark;
    await prefs.setBool(_themeKey, newIsDark);
    emit(ThemeState(isDark: newIsDark));
  }
}
