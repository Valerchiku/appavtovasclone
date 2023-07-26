// ignore_for_file: prefer-match-file-name
// ignore_for_file: member-ordering

part of 'trips_schedule_cubit.dart';


class TripsScheduleState extends Equatable {
  final SortOptions selectedOption;

  const TripsScheduleState({required this.selectedOption});

  TripsScheduleState copyWith({
    SortOptions? selectedOption,
  }) {
    return TripsScheduleState(
      selectedOption: selectedOption ?? this.selectedOption,
    );
  }

  @override
  List<Object?> get props => [selectedOption];
}
