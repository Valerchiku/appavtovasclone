part of 'main_search_cubit.dart';

final class MainSearchState extends Equatable {
  final DateTime? tripDate;

  @override
  List<Object?> get props => [
        tripDate,
      ];

  const MainSearchState({
    this.tripDate,
  });

  MainSearchState copyWith({DateTime? tripDate}) {
    return MainSearchState(
      tripDate: tripDate ?? this.tripDate,
    );
  }
}
