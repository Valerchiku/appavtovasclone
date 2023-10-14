import 'package:core/data/data_sources/interfaces/i_payment_data_source.dart';
import 'package:core/data/data_sources/interfaces/i_postgres_config_data_source.dart';
import 'package:core/data/utils/avibus_converter/avibus_converter.dart';
import 'package:core/data/utils/constants/config_keys.dart';
import 'package:core/domain/entities/avibus/avibus.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:core/domain/interfaces/i_payment_repository.dart';
import 'package:yookassa_payments_flutter/input_data/tokenization_module_input_data.dart';
import 'package:yookassa_payments_flutter/models/tokenization_result.dart';

final class PaymentRepository implements IPaymentRepository {
  final IPostgresConfigDataSource _configDataSource;
  final IPaymentDataSource _paymentDataSource;

  PaymentRepository(
    this._configDataSource,
    this._paymentDataSource,
  );

  Map<String, List<String>> get _config => _configDataSource.config;

  List<Avibus> get _avibusDbData =>
      AvibusConverter.avibusListFromEntries(_config[ConfigKeys.avibusDbData]) ??
      [];

  @override
  TokenizationModuleInputData buildTokenizationInputData({
    required String value,
    String? title,
    String? subtitle,
  }) {
    return _avibusDbData.isNotEmpty
        ? _paymentDataSource.buildTokenizationInputData(
            shopToken: _avibusDbData.first.yookassaSdkToken,
            shopId: _avibusDbData.first.yookassaShopId,
            value: value,
            title: title,
            subtitle: subtitle,
          )
        : throw Exception('Yookassa Config is empty');
  }

  @override
  Future<YookassaPayment> createPaymentObject(
    TokenizationModuleInputData tokenizationModuleInputData,
    String value,
  ) {
    return _avibusDbData.isNotEmpty
        ? _paymentDataSource.createPaymentObject(
            tokenizationModuleInputData: tokenizationModuleInputData,
            shopToken: _avibusDbData.first.yookassaApiToken,
            shopId: _avibusDbData.first.yookassaShopId,
            paymentDescription: '',
            customerEmail: '',
            customerInn: '',
            customerName: '',
            customerPhone: '',
            cost: value,
          )
        : throw Exception('Yookassa Config is empty');
  }
}
