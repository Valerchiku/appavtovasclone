part of 'passengers_cubit.dart';

final class PassengersState extends Equatable {
  final List<MockPassenger> passengers;

  @override
  List<Object?> get props => [
passengers,
      ];

  const PassengersState({
    required this.passengers,
  });

  PassengersState copyWith({required List<MockPassenger>? passengers}) {
    return PassengersState(
    passengers: passengers ?? this.passengers,
    );
  }
}
