import 'package:core/domain/entities/domain_object.dart';

final class Payment extends DomainObject {
  final String paymentUuid;
  final String paymentPrice;
  final DateTime paymentDate;
  final String paymentDescription;
  final String paymentStatus;

  @override
  List<Object?> get props => [
        paymentUuid,
        paymentPrice,
        paymentDate,
        paymentDescription,
        paymentStatus,
      ];

  const Payment({
    required this.paymentUuid,
    required this.paymentPrice,
    required this.paymentDate,
    required this.paymentDescription,
    required this.paymentStatus,
  });

  @override
  Payment copyWith({
    String? paymentPrice,
    DateTime? paymentDate,
    String? paymentDescription,
    String? paymentStatus,
  }) {
    return Payment(
      paymentUuid: paymentUuid,
      paymentPrice: paymentPrice ?? this.paymentPrice,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentDescription: paymentDescription ?? this.paymentDescription,
      paymentStatus: this.paymentStatus,
    );
  }
}
