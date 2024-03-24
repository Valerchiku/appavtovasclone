import 'package:core/domain/entities/domain_object.dart';

final class YookassaShop extends DomainObject {
  final String dbName;
  final String shopApiToken;
  final String shopSdkToken;
  final String shopId;

  const YookassaShop({
    required this.dbName,
    required this.shopApiToken,
    required this.shopSdkToken,
    required this.shopId,
  });

  @override
  List<Object?> get props => [dbName, shopApiToken, shopSdkToken, shopId];

  @override
  DomainObject copyWith() {
    throw UnimplementedError();
  }
}
