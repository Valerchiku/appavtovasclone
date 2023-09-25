import 'package:core/data/data_sources/interfaces/i_payment_data_source.dart';
import 'package:core/data/data_sources/interfaces/i_postgres_config_data_source.dart';
import 'package:core/data/utils/constants/config_keys.dart';
import 'package:core/domain/interfaces/i_payment_repository.dart';

final class PaymentRepository implements IPaymentRepository {
  final IPostgresConfigDataSource _configDataSource;
  final IPaymentDataSource _paymentDataSource;

  PaymentRepository(
    this._configDataSource,
    this._paymentDataSource,
  );

  Map<String, String> get _yookassaConfig => _configDataSource.yookassaConfig;

  @override
  Future<void> startPayment({required String value}) {
    print(_yookassaConfig);

    return _yookassaConfig.isNotEmpty
        ? _paymentDataSource.startPayment(
            shopToken: _yookassaConfig[ConfigKeys.yookassaApplicationKey]!,
            shopId: _yookassaConfig[ConfigKeys.yookassaShopId]!,
            value: value,
          )
        : throw Exception('Yookassa Config is empty');
  }
}
