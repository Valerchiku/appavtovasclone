part of 'navigation_panel_cubit.dart';

final class NavigationPanelState extends Equatable {
  final int navigationIndex;
  final bool isMainPage;
  final DialogStatuses dialogStatus;

  @override
  List<Object?> get props => [
        navigationIndex,
        dialogStatus,
      ];

  const NavigationPanelState({
    required this.navigationIndex,
    required this.isMainPage,
    required this.dialogStatus,
  });

  NavigationPanelState copyWith({
    int? navigationIndex,
    bool? isMainPage,
    DialogStatuses? dialogStatus,
  }) {
    return NavigationPanelState(
      navigationIndex: navigationIndex ?? this.navigationIndex,
      isMainPage: isMainPage ?? this.isMainPage,
      dialogStatus: dialogStatus ?? this.dialogStatus,
    );
  }
}
