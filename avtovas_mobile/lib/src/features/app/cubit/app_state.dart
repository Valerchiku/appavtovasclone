part of 'app_cubit.dart';

class AppState {
  final bool toRemoteConnected;
  final ThemeType themeType;

  AppState({
    required this.toRemoteConnected,
    required this.themeType,
  });

  AppState copyWith({bool? toRemoteConnected, ThemeType? themeType}) {
    return AppState(
      toRemoteConnected: toRemoteConnected ?? this.toRemoteConnected,
      themeType: themeType ?? this.themeType,
    );
  }
}
