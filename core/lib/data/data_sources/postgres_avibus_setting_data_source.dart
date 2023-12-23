import 'dart:convert';

import 'package:core/data/connectivity/interfaces/i_mobile_postgres_connection.dart';
import 'package:core/data/data_sources/interfaces/i_avibus_settings_data_source.dart';
import 'package:core/data/mappers/avibus/avibus_mapper.dart';
import 'package:core/data/utils/constants/private_info.dart';
import 'package:core/data/utils/sql_support/sql_requests.dart';
import 'package:core/domain/entities/avibus/avibus.dart';
import 'package:core/domain/utils/core_logger.dart';

import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

final class PostgresAvibusSettingsDataSource
    implements IAvibusSettingsDataSource {
  PostgresAvibusSettingsDataSource() {
    _fetchConfig();
  }

  @override
  Stream<List<Avibus>> get avibusSettingsStream => _avibusSettingsSubject;

  @override
  List<Avibus> get avibusSettings => _avibusSettingsSubject.value;

  final BehaviorSubject<List<Avibus>> _avibusSettingsSubject =
      BehaviorSubject();

  Future<void> _fetchConfig() async {
    try {
      final iamResponse = await http.get(
        Uri.parse(PrivateInfo.iamTokenEndpoint),
      );

      final iamToken = (jsonDecode(iamResponse.body)
          as Map<String, dynamic>)['access_token'];

      const query = 'SELECT * FROM <>';

      final response = await http.post(
        Uri.parse('https://functions.yandexcloud.net/d4ehghq307dgb1ddop2a'),
        headers: PrivateInfo.apiAuthorizationHeaders(iamToken),
        body: jsonEncode(SQLRequests.queryBody(query)),
      );

      final responseJson = jsonDecode(response.body) as List<dynamic>;

      final settingsList =
          responseJson.map((e) => AvibusMapper().fromJson(e)).toList();

      _avibusSettingsSubject.add(settingsList);

      CoreLogger.infoLog('Successful fetching avibus settings');
    } catch (e) {
      CoreLogger.errorLog(
        'Error fetching avibus setting',
        params: {'Exceptions param': e},
      );
    }
  }

  Future<void> temporaryInsert() async {
    final iamResponse = await http.get(
      Uri.parse(PrivateInfo.iamTokenEndpoint),
    );

    final iamToken =
        (jsonDecode(iamResponse.body) as Map<String, dynamic>)['access_token'];

    const avtovasModel = Avibus(
      dbName: "'AVTOVAS'",
      apiUrl: "'https://1c-avtovas.avtovas.com:443/infobase1/ws/saleport'",
      apiLogin: "'mobapl'",
      apiPassword: "'Yjd-Aht-Uhs-Cty65'",
      inn: "'2126000549'",
      yookassaShopName: '\'АО "АВТОВАС "\'',
      yookassaSdkToken: "'live_Mjc4NTY2vpvk-WctlPo3uJY0wiWVCR0f3ayh53Lj2og'",
      yookassaApiToken: "'live_95R7lG7CIH0ux2Mg4126rNVzLW1zHWo3IbPdYyhxV5A'",
      yookassaShopId: "'769931'",
      serviceDescription: "'Онлайн билет'",
      clientPhoneNumber: "'79000000000'",
      clientEmail: "'aoavtovas@mail.ru'",
      smptPassword: "'FHqmv4zbnXYsvPa2yV8S'",
      enabled: true,
    );

    final query = SQLRequests.insertInto(
      tableName: '<>',
      fieldsMap: AvibusMapper().toJson(avtovasModel),
    );

    await http.post(
      Uri.parse('https://functions.yandexcloud.net/d4ehghq307dgb1ddop2a'),
      headers: PrivateInfo.apiAuthorizationHeaders(iamToken),
      body: jsonEncode(SQLRequests.queryBody(query)),
    );
  }
}
