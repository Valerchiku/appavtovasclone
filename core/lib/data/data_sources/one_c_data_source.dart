import 'package:core/data/data_sources/interfaces/i_one_c_data_source.dart';
import 'package:core/data/mappers/bus_stop/bus_stop_mapper.dart';
import 'package:core/data/mappers/trip/trip_mapper.dart';
import 'package:core/data/utils/constants/private_info.dart';
import 'package:core/data/utils/constants/xml_request_name.dart';
import 'package:core/data/utils/xml_convertor/xml_convertor.dart';
import 'package:core/data/utils/xml_methods/xml_requests.dart';
import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

final class OneCDataSource implements IOneCDataSource {
  final BehaviorSubject<List<BusStop>> _busStopsSubject = BehaviorSubject();
  final BehaviorSubject<List<Trip>> _tripsSubject = BehaviorSubject();

  @override
  Stream<List<BusStop>> get busStopsStream => _busStopsSubject;

  @override
  Stream<List<Trip>> get tripsStream => _tripsSubject;

  @override
  Future<void> getBusStops() async {
    // AVTOVAS REQUEST
    final avtovasResponse = await http.post(
      Uri.parse(PrivateInfo.avtovasUrl),
      headers: PrivateInfo.avtovasHeaders,
      body: XmlRequests.getBusStops(),
    );
    final avtovasJsonData = XmlConverter.xmlToJson(
      response: avtovasResponse,
      xmlRequestName: XmlRequestName.getBusStops,
    );

    final avtovasBusStops = avtovasJsonData
        .map((stops) => BusStopMapper().fromJson(stops))
        .toList();

    // STEPANOV REQUEST
    // final stepanovResponse = await http.post(
    //   Uri.parse(PrivateInfo.stepanovUrl),
    //   headers: PrivateInfo.stepanovHeaders,
    //   body: XmlRequests.getBusStops(),
    // );
    // final stepanovJsonData = XmlConverter.xmlToJson(
    //   response: stepanovResponse,
    //   xmlRequestName: XmlRequestName.getBusStops,
    // );

    // final stepanovBusStops = stepanovJsonData
    //     .map((stops) => BusStopMapper().fromJson(stops))
    //     .toList();

    // COMBINING 2 REQUESTS INTO 1
    // avtovasBusStops.addAll(stepanovBusStops);

    _busStopsSubject.add(avtovasBusStops);
  }

  @override
  Future<void> getTrips({
    required String departure,
    required String destination,
    required String tripsDate,
  }) async {
    // AVTOVAS REQUEST
    final avtovasResponse = await http.post(
      Uri.parse(PrivateInfo.avtovasUrl),
      headers: PrivateInfo.avtovasHeaders,
      body: XmlRequests.getTrips(
        departure: departure,
        destination: destination,
        tripsDate: tripsDate,
      ),
    );
    final avtovasJsonData = XmlConverter.xmlToJson(
      response: avtovasResponse,
      xmlRequestName: XmlRequestName.getTrips,
    );

    final avtovasTrips =
        avtovasJsonData.map((trips) => TripMapper().fromJson(trips)).toList();

    // STEPANOV REQUEST
    // final stepanovResponse = await http.post(
    //   Uri.parse(PrivateInfo.stepanovUrl),
    //   headers: PrivateInfo.stepanovHeaders,
    //   body: XmlRequests.getTrips(
    //     departure: departure,
    //     destination: destination,
    //     tripsDate: tripsDate,
    //   ),
    // );
    // final stepanovJsonData = XmlConverter.xmlToJson(
    //   response: stepanovResponse,
    //   xmlRequestName: XmlRequestName.getTrips,
    // );

    // final stepanovTrips =
    //     stepanovJsonData.map((trips) => TripMapper().fromJson(trips)).toList();

    // COMBINING 2 REQUESTS INTO 1
    // avtovasTrips.addAll(stepanovTrips);
    _tripsSubject.add(avtovasTrips);
  }

  @override
  void clearBusStops() {
    _busStopsSubject.add([]);
  }

  @override
  void clearTrips() {
    _tripsSubject.add([]);
  }
}
