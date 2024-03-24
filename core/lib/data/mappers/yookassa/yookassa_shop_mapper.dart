import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/yookassa/yookassa_shop.dart';

abstract final class _Fields {
  static const String dbName = 'db_name';
  static const String shopApiToken = 'shop_api_token';
  static const String shopSdkToken = 'shop_sdk_token';
  static const String shopId = 'shop_id';
}

final class YookassaShopMapper implements BaseMapper<YookassaShop> {
  @override
  Map<String, dynamic> toJson(YookassaShop data) {
    return {
      _Fields.dbName: data.dbName,
      _Fields.shopApiToken: data.shopApiToken,
      _Fields.shopSdkToken: data.shopSdkToken,
      _Fields.shopId: data.shopId,
    };
  }

  @override
  YookassaShop fromJson(Map<String, dynamic> json) {
    return YookassaShop(
      dbName: json[_Fields.dbName],
      shopApiToken: json[_Fields.shopApiToken],
      shopSdkToken: json[_Fields.shopSdkToken],
      shopId: json[_Fields.shopId],
    );
  }
}
