import 'package:equatable/equatable.dart';

final class MockPassenger extends Equatable {
  final String fullName;
  final String seatOnTheBus;
  final int age;
  final String gender;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        fullName,
        seatOnTheBus,
        age,
        gender,
      ];

  const MockPassenger({
    required this.fullName,
    required this.seatOnTheBus,
    required this.age,
    required this.gender,
  });
}
