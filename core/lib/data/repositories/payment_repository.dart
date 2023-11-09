import 'package:core/avtovas_core.dart';
import 'package:core/data/data_sources/interfaces/i_payment_data_source.dart';
import 'package:core/domain/entities/avibus/avibus.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:core/domain/interfaces/i_payment_repository.dart';
import 'package:yookassa_payments_flutter/input_data/tokenization_module_input_data.dart';

final class PaymentRepository implements IPaymentRepository {
  final IAvibusSettingsDataSource _avibusSettingsDataSource;
  final IPaymentDataSource _paymentDataSource;

  PaymentRepository(
    this._avibusSettingsDataSource,
    this._paymentDataSource,
  );

  List<Avibus> get _avibusSettings => _avibusSettingsDataSource.avibusSettings;

  /*List<Avibus> get _avibusDbData =>
      AvibusConverter.avibusListFromEntries(_config[ConfigKeys.avibusDbData]) ??
      [];*/

  @override
  TokenizationModuleInputData buildTokenizationInputData({
    required String value,
    required String paymentDescription,
  }) {
    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.buildTokenizationInputData(
            shopToken: _avibusSettings.first.yookassaSdkToken,
            shopId: _avibusSettings.first.yookassaShopId,
            title: _avibusSettings.first.serviceDescription,
            value: value,
            subtitle: paymentDescription,
          )
        : throw Exception('Yookassa Config is empty');
  }

  @override
  Future<YookassaPayment> createPaymentObject({
    required TokenizationModuleInputData tokenizationModuleInputData,
    required String value,
  }) {
    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.createPaymentObject(
            tokenizationModuleInputData: tokenizationModuleInputData,
            shopToken: _avibusSettings.first.yookassaApiToken,
            shopId: _avibusSettings.first.yookassaShopId,
            paymentDescription: _avibusSettings.first.serviceDescription,
            customerEmail: _avibusSettings.first.clientEmail,
            customerInn: _avibusSettings.first.inn,
            customerName: _avibusSettings.first.yookassaShopName,
            customerPhone: _avibusSettings.first.clientPhoneNumber,
            cost: value,
          )
        : Future.value(YookassaPayment.error());
  }

  @override
  Future<String> fetchPaymentStatus({required String paymentId}) {
    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.fetchPaymentStatus(
            shopToken: _avibusSettings.first.yookassaApiToken,
            shopId: _avibusSettings.first.yookassaShopId,
            paymentId: paymentId,
          )
        : Future.value(PaymentStatuses.undefinedStatus);
  }
}
