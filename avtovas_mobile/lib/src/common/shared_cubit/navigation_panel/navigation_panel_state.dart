part of 'navigation_panel_cubit.dart';

final class NavigationPanelState extends Equatable {
  final int navigationIndex;
  final bool isMainPage;

  @override
  List<Object?> get props => [
        navigationIndex,
      ];

  const NavigationPanelState({
    required this.navigationIndex,
    required this.isMainPage,
  });

  NavigationPanelState copyWith({
    int? navigationIndex,
    bool? isMainPage,
  }) {
    return NavigationPanelState(
      navigationIndex: navigationIndex ?? this.navigationIndex,
      isMainPage: isMainPage ?? this.isMainPage,
    );
  }
}
