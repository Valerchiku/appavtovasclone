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
      _Fields.yookassaSdkToken: data.yookassaSdkToken,
      _Fields.yookassaApiToken: data.yookassaApiToken,
      _Fields.yookassaShopId: data.yookassaShopId,
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
      yookassaSdkToken: json[_Fields.yookassaSdkToken],
      yookassaApiToken: json[_Fields.yookassaApiToken],
      yookassaShopId: json[_Fields.yookassaShopId],
      serviceDescription: json[_Fields.serviceDescription],
      clientPhoneNumber: json[_Fields.clientPhoneNumber],
      clientEmail: json[_Fields.clientEmail],
      smptPassword: json[_Fields.smptPassword],
      enabled: json[_Fields.enabled],
    );
  }
}

abstract final class _Fields {
  static const String dbName = 'dbName';
  static const String apiUrl = 'apiUrl';
  static const String apiLogin = 'apiLogin';
  static const String apiPassword = 'apiPassword';
  static const String inn = 'inn';
  static const String yookassaShopName = 'yookassaShopName';
  static const String yookassaSdkToken = 'yookassaSdkToken';
  static const String yookassaApiToken = 'yookassaApiToken';
  static const String yookassaShopId = 'yookassaShopId';
  static const String serviceDescription = 'serviceDescription';
  static const String clientPhoneNumber = 'clientPhoneNumber';
  static const String clientEmail = 'clientEmail';
  static const String smptPassword = 'smptPassword';
  static const String enabled = 'enabled';
}
