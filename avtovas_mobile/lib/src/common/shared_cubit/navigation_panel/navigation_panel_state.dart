part of 'navigation_panel_cubit.dart';

final class NavigationPanelState extends Equatable {
  final int navigationIndex;
  final bool isMainPage;
  final AlertStatuses alertStatus;
  final ProfileAlertTypes alertType;

  @override
  List<Object?> get props => [
        navigationIndex,
        alertType,
        alertStatus,
      ];

  const NavigationPanelState({
    required this.navigationIndex,
    required this.isMainPage,
    required this.alertStatus,
    required this.alertType,
  });

  NavigationPanelState copyWith({
    int? navigationIndex,
    bool? isMainPage,
    AlertStatuses? alertStatus,
    ProfileAlertTypes? alertType,
  }) {
    return NavigationPanelState(
      navigationIndex: navigationIndex ?? this.navigationIndex,
      isMainPage: isMainPage ?? this.isMainPage,
      alertType: alertType ?? this.alertType,
      alertStatus: alertStatus ?? this.alertStatus,
    );
  }
}
