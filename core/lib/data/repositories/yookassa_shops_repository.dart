import 'package:core/avtovas_core.dart';
import 'package:core/domain/interfaces/i_yookassa_shops_repository.dart';

final class YookassaShopsRepository implements IYookassaShopsRepository {
  final IYookassaShopsConfigDataSource _yookassaShopsConfigDataSource;

  YookassaShopsRepository(this._yookassaShopsConfigDataSource);

  @override
  Future<void> tryFetchConfig() {
    return _yookassaShopsConfigDataSource.tryFetchConfig();
  }
}
