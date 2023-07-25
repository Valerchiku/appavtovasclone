// ignore_for_file: prefer-match-file-name
// ignore_for_file: member-ordering

part of 'trips_schedule_cubit.dart';

enum SortOptions { byTime, byPrice }

class TripsScheduleState extends Equatable {
  final SortOptions selectedOption;

  const TripsScheduleState({required this.selectedOption});

  @override
  List<Object?> get props => [selectedOption];
}
