import 'package:core/data/data_sources/interfaces/i_avibus_settings_data_source.dart';
import 'package:core/domain/entities/avibus/avibus.dart';
import 'package:core/domain/interfaces/i_avibus_settings_repository.dart';

final class AvibusSettingsRepository implements IAvibusSettingsRepository {
  final IAvibusSettingsDataSource _avibusSettingsDataSource;

  AvibusSettingsRepository(this._avibusSettingsDataSource);

  @override
  Stream<List<Avibus>> get avibusSettingsStream =>
      _avibusSettingsDataSource.avibusSettingsStream;

  @override
  List<Avibus> get avibusSettings => _avibusSettingsDataSource.avibusSettings;
}
