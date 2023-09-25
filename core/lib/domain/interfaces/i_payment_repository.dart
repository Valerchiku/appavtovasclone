abstract interface class IPaymentRepository {
  Future<void> startPayment({required String value});
}
