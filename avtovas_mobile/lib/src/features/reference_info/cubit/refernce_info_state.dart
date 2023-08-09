part of 'refernce_info_cubit.dart';

final class RefereceInfoState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const RefereceInfoState({
    required this.route,
  });

  RefereceInfoState copyWith({
    CustomRoute? route,
    bool? showNotifications,
  }) {
    return RefereceInfoState(
      route: route ?? this.route,
    );
  }
}
