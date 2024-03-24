part of 'app_configuration_cubit.dart';

final class AppConfigurationState extends Equatable {
  final int navigationIndex;
  final bool isMainPage;
  final bool shouldShowConnectionFailedDialog;
  final bool shouldShowLoadingIndicator;

  @override
  List<Object?> get props => [
        navigationIndex,
        isMainPage,
        shouldShowConnectionFailedDialog,
        shouldShowLoadingIndicator,
      ];

  const AppConfigurationState({
    required this.navigationIndex,
    required this.isMainPage,
    required this.shouldShowConnectionFailedDialog,
    required this.shouldShowLoadingIndicator,
  });

  AppConfigurationState copyWith(
      {int? navigationIndex,
      bool? isMainPage,
      bool? shouldShowConnectionFailedDialog,
      bool? shouldShowLoadingIndicator}) {
    return AppConfigurationState(
      navigationIndex: navigationIndex ?? this.navigationIndex,
      isMainPage: isMainPage ?? this.isMainPage,
      shouldShowConnectionFailedDialog: shouldShowConnectionFailedDialog ??
          this.shouldShowConnectionFailedDialog,
      shouldShowLoadingIndicator:
          shouldShowLoadingIndicator ?? this.shouldShowLoadingIndicator,
    );
  }
}
