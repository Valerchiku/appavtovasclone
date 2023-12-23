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

  // ignore: unused_element
  Future<void> temporaryInsert() async {
    try {
      const avtovasModel = Avibus(
        dbName: 'AVTOVAS',
        apiUrl: 'http://1c-avtovas.avtovas.com:8088/infobase1/ws/saleport',
        apiLogin: 'mobapl',
        apiPassword: 'Yjd-Aht-Uhs-Cty65',
        inn: '2126000549',
        yookassaShopName: 'АО "АВТОВАС"',
        yookassaSdkToken: 'test_NzY5OTMxgOEfwbWp559NVT328GWyYFk--efJBtiVi1Q',
        yookassaApiToken: 'test_BCUb_u3SxG8tL0LfN6TWcVUPixbJ1HXVoGysivRBVUY',
        yookassaShopId: '769931',
        serviceDescription: 'Онлайн билет',
        clientPhoneNumber: '79000000000',
        clientEmail: 'aoavtovas@mail.ru',
        smptPassword: 'FHqmv4zbnXYsvPa2yV8S',
        enabled: true,
      );

      final jsonList = [avtovasModel];

      for (final json in jsonList) {
        _fireInstance.collection('Config').doc('Avibus_settings').set(
          {
            json.dbName: AvibusMapper().toJson(json),
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
