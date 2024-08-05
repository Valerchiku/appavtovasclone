import 'package:collection/collection.dart';
import 'package:core/data/data_sources/interfaces/i_avibus_settings_data_source.dart';
import 'package:core/data/data_sources/interfaces/i_payment_data_source.dart';
import 'package:core/data/utils/yookassa_helper/payment_statuses.dart';
import 'package:core/domain/entities/app_entities/user.dart';
import 'package:core/domain/entities/avibus/avibus.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:core/domain/interfaces/i_payment_repository.dart';
import 'package:yookassa_payments_flutter/input_data/tokenization_module_input_data.dart';

final class TestPaymentRepository implements IPaymentRepository {
  final IAvibusSettingsDataSource _avibusSettingsDataSource;
  final IPaymentDataSource _paymentDataSource;

  TestPaymentRepository(
    this._avibusSettingsDataSource,
    this._paymentDataSource,
  );

  List<Avibus> get _avibusSettings => _avibusSettingsDataSource.avibusSettings;

  @override
  TokenizationModuleInputData buildTokenizationInputData({
    required String dbName,
    required String value,
    required String paymentDescription,
  }) {
    final concreteAvibusSettings = _avibusSettings.firstWhere(
      (avibus) => avibus.dbName == dbName,
    );

    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.buildTokenizationInputData(
            shopToken: 'test_NzY5OTMxgOEfwbWp559NVT328GWyYFk--efJBtiVi1Q',
            shopId: '769931',
            title: concreteAvibusSettings.serviceDescription,
            value: value,
            subtitle: paymentDescription,
          )
        : throw Exception('Yookassa Config is empty');
  }

  @override
  Future<(String, String)> generateConfirmationToken({
    required User user,
    required String dbName,
    required String value,
  }) {
    final concreteAvibusSettings = _avibusSettings.firstWhere(
      (avibus) => avibus.dbName == dbName,
    );

    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.generateConfirmationToken(
            dbName: dbName,
            user: user,
            paymentDescription: concreteAvibusSettings.serviceDescription,
            customerEmail: concreteAvibusSettings.clientEmail,
            customerInn: concreteAvibusSettings.inn,
            customerName: concreteAvibusSettings.yookassaShopName,
            customerPhone: concreteAvibusSettings.clientPhoneNumber,
            cost: value,
          )
        : throw Exception('Yookassa Config is empty');
  }

  @override
  Future<YookassaPayment> createPaymentObject({
    required User user,
    required String dbName,
    required TokenizationModuleInputData tokenizationModuleInputData,
    required String value,
  }) {
    final concreteAvibusSettings = _avibusSettings.firstWhere(
      (avibus) => avibus.dbName == dbName,
    );

    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.createPaymentObject(
            user: user,
            tokenizationModuleInputData: tokenizationModuleInputData,
            shopToken: 'test_BCUb_u3SxG8tL0LfN6TWcVUPixbJ1HXVoGysivRBVUY',
            shopId: '769931',
            paymentDescription: concreteAvibusSettings.serviceDescription,
            customerEmail: concreteAvibusSettings.clientEmail,
            customerInn: concreteAvibusSettings.inn,
            customerName: concreteAvibusSettings.yookassaShopName,
            customerPhone: concreteAvibusSettings.clientPhoneNumber,
            cost: value,
          )
        : Future.value(YookassaPayment.error());
  }

  @override
  Future<(String, String)> refundPayment({
    required User user,
    required String dbName,
    required String paymentId,
    required double refundCostAmount,
  }) {
    final concreteAvibusSettings = _avibusSettings.firstWhereOrNull(
      (avibus) => avibus.dbName == dbName,
    );

    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.refundPayment(
            user: user,
            paymentId: paymentId,
            refundCostAmount: refundCostAmount,
            dbName: dbName,
            shopApiToken: 'test_BCUb_u3SxG8tL0LfN6TWcVUPixbJ1HXVoGysivRBVUY',
            shopId: '769931',
            paymentDescription: concreteAvibusSettings?.serviceDescription,
            customerEmail: concreteAvibusSettings?.clientEmail,
            customerInn: concreteAvibusSettings?.inn,
            customerName: concreteAvibusSettings?.yookassaShopName,
            customerPhone: concreteAvibusSettings?.clientPhoneNumber,
          )
        : Future.value(('error', 'error'));
  }

  @override
  Future<String> fetchPaymentStatus({
    required String dbName,
    required String paymentId,
  }) {
    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.fetchPaymentStatus(
            dbName: dbName,
            shopToken: 'test_BCUb_u3SxG8tL0LfN6TWcVUPixbJ1HXVoGysivRBVUY',
            shopId: '769931',
            paymentId: paymentId,
          )
        : Future.value(PaymentStatuses.undefinedStatus);
  }
}
