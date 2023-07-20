part of 'app_cubit.dart';

class AppState {
  final ThemeType themeType;

  AppState({
    required this.themeType,
  });

  AppState copyWith({ThemeType? themeType}) {
    return AppState(
      themeType: themeType ?? this.themeType,
    );
  }
}
