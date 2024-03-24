part of 'payments_history_cubit.dart';

final class PaymentsHistoryState extends Equatable {
  final CustomRoute route;
  final List<Payment>? payments;
  final List<StatusedTrip>? statusedTrips;

  @override
  List<Object?> get props => [route, payments];

  const PaymentsHistoryState({
    required this.route,
    this.statusedTrips,
    this.payments,
  });

  PaymentsHistoryState copyWith({
    CustomRoute? route,
    List<Payment>? payments,
    List<StatusedTrip>? statusedTrips,
  }) {
    return PaymentsHistoryState(
      route: route ?? this.route,
      statusedTrips: statusedTrips ?? this.statusedTrips,
      payments: payments ?? this.payments,
    );
  }
}
