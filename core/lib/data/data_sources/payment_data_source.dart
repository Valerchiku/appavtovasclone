import 'package:core/data/data_sources/interfaces/i_payment_data_source.dart';
// import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';

final class PaymentDataSource implements IPaymentDataSource {
  @override
  Future<void> startPayment({
    required String shopToken,
    required String shopId,
    required String value,
  }) async {
    // final paymentAmount = Amount(
    //   value: double.parse(value),
    //   currency: Currency.rub,
    // );

    // final tokenizationModuleInputData = TokenizationModuleInputData(
    //   clientApplicationKey: shopToken,
    //   title: 'Title',
    //   subtitle: 'Subtitle',
    //   amount: paymentAmount,
    //   savePaymentMethod: SavePaymentMethod.on,
    //   tokenizationSettings: const TokenizationSettings(
    //     PaymentMethodTypes.bankCard,
    //   ),
    //   shopId: shopId,
    // );

    // final result = await YookassaPaymentsFlutter.tokenization(
    //   tokenizationModuleInputData,
    // );

    // if (result is SuccessTokenizationResult) {
    //   print(result.token);
    //   print(result.paymentMethodType);
    // }
  }
}
