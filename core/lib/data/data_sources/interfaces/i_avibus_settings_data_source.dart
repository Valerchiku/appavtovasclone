import 'package:core/domain/entities/avibus/avibus.dart';

abstract interface class IAvibusSettingsDataSource {
  Stream<List<Avibus>> get avibusSettingsStream;

  List<Avibus> get avibusSettings;

  Future<void> tryFetchConfig();
}
