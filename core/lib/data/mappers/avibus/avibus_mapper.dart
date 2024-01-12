import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/avibus/avibus.dart';

final class AvibusMapper implements BaseMapper<Avibus> {
  @override
  Map<String, dynamic> toJson(Avibus data) {
    return {
      _Fields.dbName: data.dbName,
      _Fields.apiUrl: data.apiUrl,
      _Fields.apiLogin: data.apiLogin,
      _Fields.apiPassword: data.apiPassword,
      _Fields.inn: data.inn,
      _Fields.yookassaShopName: data.yookassaShopName,
      _Fields.serviceDescription: data.serviceDescription,
      _Fields.clientPhoneNumber: data.clientPhoneNumber,
      _Fields.clientEmail: data.clientEmail,
      _Fields.smptPassword: data.smptPassword,
      _Fields.enabled: data.enabled,
    };
  }

  @override
  Avibus fromJson(Map<String, dynamic> json) {
    return Avibus(
      dbName: json[_Fields.dbName],
      apiUrl: json[_Fields.apiUrl],
      apiLogin: json[_Fields.apiLogin],
      apiPassword: json[_Fields.apiPassword],
      inn: json[_Fields.inn],
      yookassaShopName: json[_Fields.yookassaShopName],
      serviceDescription: json[_Fields.serviceDescription],
      clientPhoneNumber: json[_Fields.clientPhoneNumber],
      clientEmail: json[_Fields.clientEmail],
      smptPassword: json[_Fields.smptPassword],
      enabled: json[_Fields.enabled],
    );
  }
}

abstract final class _Fields {
  static const String dbName = 'db_name';
  static const String apiUrl = 'api_url';
  static const String apiLogin = 'ali_login';
  static const String apiPassword = 'api_password';
  static const String inn = 'inn';
  static const String yookassaShopName = 'yookassa_shop_name';
  static const String serviceDescription = 'service_description';
  static const String clientPhoneNumber = 'client_phone';
  static const String clientEmail = 'client_email';
  static const String smptPassword = 'smpt_password';
  static const String enabled = 'enabled';
}
