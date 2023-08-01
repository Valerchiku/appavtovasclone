import 'package:equatable/equatable.dart';

final class MockPassenger extends Equatable {
  final String fullName;
  final String seatOnTheBus;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        fullName,
        seatOnTheBus,
      ];

  const MockPassenger({
    required this.fullName,
    required this.seatOnTheBus,
  });
}
