part of 'payments_history_cubit.dart';

final class PaymentsHistoryState extends Equatable {
  final CustomRoute route;
  final List<Payment>? payments;

  @override
  List<Object?> get props => [route, payments];

  const PaymentsHistoryState({
    required this.route,
    this.payments,
  });

  PaymentsHistoryState copyWith({
    CustomRoute? route,
    List<Payment>? payments,
  }) {
    return PaymentsHistoryState(
      route: route ?? this.route,
      payments: payments ?? this.payments,
    );
  }
}
