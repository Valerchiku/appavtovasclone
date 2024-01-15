enum PaymentHistoryStatus { refund, paid }

abstract final class PaymentHistoryStatusHandler {
  static PaymentHistoryStatus paymentHistoryStatusFromString(String status) {
    return PaymentHistoryStatus.values.firstWhere(
      (e) => e.name == status,
      orElse: () => PaymentHistoryStatus.paid,
    );
  }
}
