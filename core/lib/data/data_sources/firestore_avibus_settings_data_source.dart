import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/data/mappers/avibus/avibus_mapper.dart';
import 'package:core/domain/entities/avibus/avibus.dart';
import 'package:rxdart/rxdart.dart';

final class FireStoreAvibusSettingsDataSource
    implements IAvibusSettingsDataSource {
  final _fireInstance = FirebaseFirestore.instance;

  FireStoreAvibusSettingsDataSource() {
    _fetchSettings();
  }

  final BehaviorSubject<List<Avibus>> _avibusSubject = BehaviorSubject();

  @override
  Stream<List<Avibus>> get avibusSettingsStream => _avibusSubject;

  @override
  List<Avibus> get avibusSettings =>
      _avibusSubject.hasValue ? _avibusSubject.value : [];

  Future<void> _fetchSettings() async {
    try {
      final collection = _fireInstance.collection('Config');

      final avibusSnapshot = await collection.doc('Avibus_settings').get();

      final avibusData = avibusSnapshot.data();

      if (avibusData == null) {
        throw Exception();
      }

      final avibusObjectList = <Avibus>[];

      for (final avibusJson in avibusData.values) {
        avibusObjectList.add(
          AvibusMapper().fromJson(avibusJson),
        );
      }

      _avibusSubject.add(avibusObjectList);
    } catch (e) {
      return;
    }
  }
}
