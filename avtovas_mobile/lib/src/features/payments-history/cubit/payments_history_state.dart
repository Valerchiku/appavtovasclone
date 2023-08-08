part of 'payments_history_cubit.dart';

final class PaymentsHistoryState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [route];

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
