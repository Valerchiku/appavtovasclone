import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/core/data/data_source/interfaces/i_payment_data_source.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/core/domain/interfaces/i_payment_repository.dart';
import 'package:core/data/data_sources/interfaces/i_postgres_config_data_source.dart';
import 'package:core/data/utils/constants/config_keys.dart';
import 'package:yookassa_payments_flutter/input_data/tokenization_module_input_data.dart';
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';

final class PaymentRepository implements IPaymentRepository {
  final IPostgresConfigDataSource _configDataSource;
  final IPaymentDataSource _paymentDataSource;

  PaymentRepository(
    this._configDataSource,
    this._paymentDataSource,
  );

  Map<String, String> get _yookassaConfig => _configDataSource.yookassaConfig;

  @override
  TokenizationModuleInputData buildTokenizationInputData({
    required String value,
    String? title,
    String? subtitle,
  }) {
    return _yookassaConfig.isNotEmpty
        ? _paymentDataSource.buildTokenizationInputData(
            shopToken: _yookassaConfig[ConfigKeys.yookassaApplicationKey]!,
            shopId: _yookassaConfig[ConfigKeys.yookassaShopId]!,
            value: value,
            title: title,
            subtitle: subtitle,
          )
        : throw Exception('Yookassa Config is empty');
  }

  @override
  Future<void> startPayment(TokenizationResult result) {
    return _paymentDataSource.startPayment(result);
  }
}
