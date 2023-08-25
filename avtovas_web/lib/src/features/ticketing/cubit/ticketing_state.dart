part of 'ticketing_cubit.dart';

final class TicketingState {
  final CustomRoute route;

  const TicketingState({
    required this.route,
  });

TicketingState copyWith({CustomRoute? route,}) {
    return TicketingState(
      route: route ?? this.route,
    );
  }
}
