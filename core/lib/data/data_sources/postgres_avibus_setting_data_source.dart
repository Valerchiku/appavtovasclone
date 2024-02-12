import 'dart:convert';

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

      final response = await http.post(
        Uri.parse(PrivateInfo.yookassaShopsFetchingEndpoint),
        headers: PrivateInfo.apiAuthorizationHeaders(iamToken),
        body: jsonEncode({'token': 'HmaHp60s0Fl4yLaX'}),
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
}
