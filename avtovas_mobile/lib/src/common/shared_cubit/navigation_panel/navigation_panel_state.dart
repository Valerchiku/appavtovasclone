part of 'navigation_panel_cubit.dart';

final class NavigationPanelState extends Equatable {
  final int navigationIndex;
  final bool isMainPage;
  final BottomSheetStatuses alertStatus;
  final MainAlertTypes? alertType;
  final AuthorizationCubit? authCubit;

@override
  List<Object?> get props => [
        navigationIndex,
        alertType,
        alertStatus,
        authCubit,
      ];

  const NavigationPanelState({
    required this.navigationIndex,
    required this.isMainPage,
    required this.alertStatus,
    this.alertType,
    this.authCubit,
  });

  NavigationPanelState copyWith({
    int? navigationIndex,
    bool? isMainPage,
    MainAlertTypes? alertType,
    BottomSheetStatuses? alertStatus,
    AuthorizationCubit? authCubit,
  }) {
    return NavigationPanelState(
      navigationIndex: navigationIndex ?? this.navigationIndex,
      isMainPage: isMainPage ?? this.isMainPage,
      alertType: alertType ?? this.alertType,
      alertStatus: alertStatus ?? this.alertStatus,
      authCubit: authCubit ?? this.authCubit,
    );
  }
}
