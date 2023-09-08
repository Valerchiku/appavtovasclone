import 'package:core/domain/entities/domain_object.dart';

final class PaymentHistory extends DomainObject {
  final String paymentPrice;
  final DateTime paymentDate;
  final String paymentDescription;

  @override
  List<Object?> get props => [
        paymentPrice,
        paymentDate,
        paymentDescription,
      ];

  const PaymentHistory({
    required this.paymentPrice,
    required this.paymentDate,
    required this.paymentDescription,
  });

  @override
  PaymentHistory copyWith({
    String? paymentPrice,
    DateTime? paymentDate,
    String? paymentDescription,
  }) {
    return PaymentHistory(
      paymentPrice: paymentPrice ?? this.paymentPrice,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentDescription: paymentDescription ?? this.paymentDescription,
    );
  }
}
