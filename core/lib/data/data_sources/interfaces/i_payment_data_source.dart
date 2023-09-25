abstract interface class IPaymentDataSource {
  Future<void> startPayment({
    required String shopToken,
    required String shopId,
    required String value,
  });
}
