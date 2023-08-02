part of 'passengers_cubit.dart';

final class PassengersState extends Equatable {
  final List<MockPassenger> items;

  @override
  List<Object?> get props => [
        items,
      ];

  const PassengersState({
    required this.items,
  });

  PassengersState copyWith({required List<MockPassenger>? items}) {
    return PassengersState(
      items: items ?? this.items,
    );
  }
}
