/*import 'package:collection/collection.dart';
import 'package:core/data/data_sources/interfaces/i_avibus_settings_data_source.dart';
import 'package:core/data/data_sources/interfaces/i_payment_data_source.dart';
import 'package:core/data/data_sources/interfaces/i_yookassa_shops_config_data_source.dart';
import 'package:core/data/utils/yookassa_helper/payment_statuses.dart';
import 'package:core/domain/entities/avibus/avibus.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:core/domain/entities/yookassa/yookassa_shop.dart';
import 'package:core/domain/interfaces/i_payment_repository.dart';
import 'package:yookassa_payments_flutter/input_data/tokenization_module_input_data.dart';

final class PaymentRepository implements IPaymentRepository {
  final IYookassaShopsConfigDataSource? _shopsConfigDataSource;
  final IAvibusSettingsDataSource _avibusSettingsDataSource;
  final IPaymentDataSource _paymentDataSource;

  PaymentRepository(
    this._shopsConfigDataSource,
    this._avibusSettingsDataSource,
    this._paymentDataSource,
  );

  List<YookassaShop> get _yookassaShops =>
      _shopsConfigDataSource?.yookassaShops ?? [];

  List<Avibus> get _avibusSettings => _avibusSettingsDataSource.avibusSettings;

  @override
  TokenizationModuleInputData buildTokenizationInputData({
    required String dbName,
    required String value,
    required String paymentDescription,
  }) {
    final concreteYookassaShop = _yookassaShops.firstWhere(
      (shop) => shop.dbName == dbName,
    );

    final concreteAvibusSettings = _avibusSettings.firstWhere(
      (avibus) => avibus.dbName == dbName,
    );

    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.buildTokenizationInputData(
            shopToken: concreteYookassaShop.shopSdkToken,
            //'test_NzY5OTMxgOEfwbWp559NVT328GWyYFk--efJBtiVi1Q',
            shopId: concreteYookassaShop.shopId,
            // '769931',
            title: concreteAvibusSettings.serviceDescription,
            value: value,
            subtitle: paymentDescription,
          )
        : throw Exception('Yookassa Config is empty');
  }

  @override
  Future<(String, String)> generateConfirmationToken({
    required String dbName,
    required String value,
  }) {
    final concreteAvibusSettings = _avibusSettings.firstWhere(
      (avibus) => avibus.dbName == dbName,
    );

    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.generateConfirmationToken(
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
    required String dbName,
    required TokenizationModuleInputData tokenizationModuleInputData,
    required String value,
  }) {
    final concreteYookassaShop = _yookassaShops.firstWhere(
      (shop) => shop.dbName == dbName,
    );

    final concreteAvibusSettings = _avibusSettings.firstWhere(
      (avibus) => avibus.dbName == dbName,
    );

    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.createPaymentObject(
            tokenizationModuleInputData: tokenizationModuleInputData,
            shopToken: concreteYookassaShop.shopApiToken,
            //'test_BCUb_u3SxG8tL0LfN6TWcVUPixbJ1HXVoGysivRBVUY',
            shopId: concreteYookassaShop.shopId,
            //'769931',
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
    required String dbName,
    required String paymentId,
    required double refundCostAmount,
  }) {
    final concreteYookassaShop = _yookassaShops.firstWhereOrNull(
      (shop) => shop.dbName == dbName,
    );

    final concreteAvibusSettings = _avibusSettings.firstWhereOrNull(
      (avibus) => avibus.dbName == dbName,
    );

    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.refundPayment(
            paymentId: paymentId,
            refundCostAmount: refundCostAmount,
            dbName: dbName,
            shopApiToken: concreteYookassaShop?.shopApiToken,
            //'test_BCUb_u3SxG8tL0LfN6TWcVUPixbJ1HXVoGysivRBVUY',
            shopId: concreteYookassaShop?.shopId,
            //'769931',
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
    final concreteYookassaShop = _yookassaShops.firstWhereOrNull(
      (shop) => shop.dbName == dbName,
    );

    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.fetchPaymentStatus(
            dbName: dbName,
            shopToken: concreteYookassaShop?.shopApiToken,
            //'test_BCUb_u3SxG8tL0LfN6TWcVUPixbJ1HXVoGysivRBVUY'//,
            shopId: concreteYookassaShop?.shopId,
            //'769931',
            paymentId: paymentId,
          )
        : Future.value(PaymentStatuses.undefinedStatus);
  }
}*/

import 'package:collection/collection.dart';
import 'package:core/data/data_sources/interfaces/i_avibus_settings_data_source.dart';
import 'package:core/data/data_sources/interfaces/i_payment_data_source.dart';
import 'package:core/data/data_sources/interfaces/i_yookassa_shops_config_data_source.dart';
import 'package:core/data/utils/yookassa_helper/payment_statuses.dart';
import 'package:core/domain/entities/avibus/avibus.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:core/domain/entities/yookassa/yookassa_shop.dart';
import 'package:core/domain/interfaces/i_payment_repository.dart';
import 'package:yookassa_payments_flutter/input_data/tokenization_module_input_data.dart';

final class PaymentRepository implements IPaymentRepository {
  final IYookassaShopsConfigDataSource? _shopsConfigDataSource;
  final IAvibusSettingsDataSource _avibusSettingsDataSource;
  final IPaymentDataSource _paymentDataSource;

  PaymentRepository(
    this._shopsConfigDataSource,
    this._avibusSettingsDataSource,
    this._paymentDataSource,
  );

  List<YookassaShop> get _yookassaShops =>
      _shopsConfigDataSource?.yookassaShops ?? [];

  List<Avibus> get _avibusSettings => _avibusSettingsDataSource.avibusSettings;

  @override
  TokenizationModuleInputData buildTokenizationInputData({
    required String dbName,
    required String value,
    required String paymentDescription,
  }) {
    final concreteYookassaShop = _yookassaShops.firstWhere(
      (shop) => shop.dbName == dbName,
    );

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
    required String dbName,
    required String value,
  }) {
    final concreteAvibusSettings = _avibusSettings.firstWhere(
      (avibus) => avibus.dbName == dbName,
    );

    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.generateConfirmationToken(
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
    required String dbName,
    required TokenizationModuleInputData tokenizationModuleInputData,
    required String value,
  }) {
    final concreteYookassaShop = _yookassaShops.firstWhere(
      (shop) => shop.dbName == dbName,
    );

    final concreteAvibusSettings = _avibusSettings.firstWhere(
      (avibus) => avibus.dbName == dbName,
    );

    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.createPaymentObject(
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
    required String dbName,
    required String paymentId,
    required double refundCostAmount,
  }) {
    final concreteYookassaShop = _yookassaShops.firstWhereOrNull(
      (shop) => shop.dbName == dbName,
    );

    final concreteAvibusSettings = _avibusSettings.firstWhereOrNull(
      (avibus) => avibus.dbName == dbName,
    );

    return _avibusSettings.isNotEmpty
        ? _paymentDataSource.refundPayment(
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
    final concreteYookassaShop = _yookassaShops.firstWhereOrNull(
      (shop) => shop.dbName == dbName,
    );

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
