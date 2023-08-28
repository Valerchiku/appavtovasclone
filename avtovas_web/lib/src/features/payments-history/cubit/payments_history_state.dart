part of 'payments_history_cubit.dart';

final class PaymentsHistoryState {
  final CustomRoute route;

  const PaymentsHistoryState({
    required this.route,
  });

PaymentsHistoryState copyWith({
    CustomRoute? route,
  }) {
    return PaymentsHistoryState(
      route: route ?? this.route,
    );
  }
}
