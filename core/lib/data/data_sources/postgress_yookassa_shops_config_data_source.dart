import 'dart:convert';

import 'package:core/data/data_sources/interfaces/i_yookassa_shops_config_data_source.dart';
import 'package:core/data/mappers/yookassa/yookassa_shop_mapper.dart';
import 'package:core/data/utils/constants/private_info.dart';
import 'package:core/domain/entities/yookassa/yookassa_shop.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

final class PostgresYookassaShopsConfigDataSource
    implements IYookassaShopsConfigDataSource {
  PostgresYookassaShopsConfigDataSource() {
    tryFetchConfig();
  }

  @override
  Stream<List<YookassaShop>> get yookassaShopsStream => _yookassaShopsSubject;

  @override
  List<YookassaShop> get yookassaShops =>
      _yookassaShopsSubject.hasValue ? _yookassaShopsSubject.value : [];

  final BehaviorSubject<List<YookassaShop>> _yookassaShopsSubject =
      BehaviorSubject();

  @override
  Future<void> tryFetchConfig() => _fetchConfig();

  Future<void> _fetchConfig() async {
    try {
      final iamResponse = await http.get(
        Uri.parse(PrivateInfo.iamTokenEndpoint),
      );

      final iamToken = (jsonDecode(iamResponse.body)
          as Map<String, dynamic>)['access_token'];

      final response = await http.post(
        Uri.parse(PrivateInfo.yookassaShopsFetchingEndpoint),
        headers: PrivateInfo.apiAuthorizationHeaders(iamToken),
        body: jsonEncode({'token': 'z9uoH7Lt9m1QVCCZ'}),
      );

      final jsonResponses = jsonDecode(response.body) as List<dynamic>;

      final shopsList =
          jsonResponses.map((e) => YookassaShopMapper().fromJson(e)).toList();

      print(shopsList);

      _yookassaShopsSubject.add(shopsList);

      CoreLogger.infoLog('Successful fetching yookassa shops config');
    } catch (e) {
      CoreLogger.errorLog('Yookassa shops fetching error');
    }
  }
}
