import 'package:equatable/equatable.dart';

final class MockBooking extends Equatable {
  final String orderNumber;
  final int bookingTimer;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        orderNumber,
        bookingTimer,
      ];

  const MockBooking({
    required this.orderNumber,
    required this.bookingTimer,
  });
}
