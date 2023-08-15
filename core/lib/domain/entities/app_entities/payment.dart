import 'package:core/domain/entities/domain_object.dart';

final class Payment extends DomainObject {
  final String paymentPrice;
  final DateTime paymentDate;
  final String paymentDescription;

  @override
  List<Object?> get props => [
        paymentPrice,
        paymentDate,
        paymentDescription,
      ];

  const Payment({
    required this.paymentPrice,
    required this.paymentDate,
    required this.paymentDescription,
  });

  @override
  Payment copyWith({
    String? paymentPrice,
    DateTime? paymentDate,
    String? paymentDescription,
  }) {
    return Payment(
      paymentPrice: paymentPrice ?? this.paymentPrice,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentDescription: paymentDescription ?? this.paymentDescription,
    );
  }
}
