import 'package:core/domain/entities/yookassa/yookassa_shop.dart';

abstract interface class IYookassaShopsConfigDataSource {
  Stream<List<YookassaShop>> get yookassaShopsStream;

  List<YookassaShop> get yookassaShops;

  Future<void> tryFetchConfig();
}
