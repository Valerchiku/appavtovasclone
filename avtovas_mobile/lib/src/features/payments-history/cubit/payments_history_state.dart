part of 'payments_history_cubit.dart';

final class PaymentsHistoryState extends Equatable {
  final CustomRoute route;
  final List<Payment>? payments;
  final List<StatusedTrip>? trips;

  @override
  List<Object?> get props => [route, payments, trips];

  const PaymentsHistoryState({
    required this.route,
    this.trips,
    this.payments,
  });

  PaymentsHistoryState copyWith({
    CustomRoute? route,
    List<StatusedTrip>? statusedTrip,
    List<Payment>? payments,
  }) {
    return PaymentsHistoryState(
      route: route ?? this.route,
      trips: statusedTrip ?? this.trips,
      payments: payments ?? this.payments,
    );
  }
}
