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

// ignore_for_file: avoid_print

final class OneCDataSource implements IOneCDataSource {
  final BehaviorSubject<List<BusStop>> _busStopsSubject = BehaviorSubject();
  final BehaviorSubject<List<Trip>> _tripsSubject = BehaviorSubject();
  // final BehaviorSubject<List<SingleTrip>> _singleTripSubject =
      // BehaviorSubject();

  @override
  Stream<List<BusStop>> get busStopsStream => _busStopsSubject;

  @override
  Stream<List<Trip>> get tripsStream => _tripsSubject;

  // @override
  // Stream<List<SingleTrip>> get singleTripSteam => _singleTripSubject;

  @override
  Future<void> getBusStops() async {
    // AVTOVAS REQUEST
    final avtovasRequest = http.post(
      Uri.parse(PrivateInfo.avtovasUrl),
      headers: PrivateInfo.avtovasHeaders,
      body: XmlRequests.getBusStops(),
    );

    // STEPANOV REQUEST
    final stepanovRequest = http.post(
      Uri.parse(PrivateInfo.stepanovUrl),
      headers: PrivateInfo.stepanovHeaders,
      body: XmlRequests.getBusStops(),
    );

    // SEND BOTH REQUEST SIMULTANEOUSLY
    final responses = await Future.wait([avtovasRequest, stepanovRequest]);

    // RESPONSES
    final avtovasResponse = responses[0];
    final stepanovResponse = responses[1];

    try {
    print('RESPONSE: $avtovasResponse');
      if (avtovasResponse.statusCode == 200 &&
          stepanovResponse.statusCode == 200) {
        // AVTOVAS RESPONSE CONVERT
        final avtovasJsonData = XmlConverter.xml2JsonConvert(
          response: avtovasResponse.body,
          xmlRequestName: XmlRequestName.getBusStops,
        );
        // STEPANOV RESPONSE CONVERT
        final stepanovJsonData = XmlConverter.xml2JsonConvert(
          response: stepanovResponse.body,
          xmlRequestName: XmlRequestName.getBusStops,
        );

        // CONVERT BOTH JSON DATA INTO STOPS LIST
        final avtovasStops = avtovasJsonData
            .map((stops) => BusStopMapper().fromJson(stops))
            .toList();
        final stepanovStops = stepanovJsonData
            .map((stops) => BusStopMapper().fromJson(stops))
            .toList();

        // COMBINED 2 TRIP LIST INTO 1
        final combinedStops = avtovasStops + stepanovStops;

        _busStopsSubject.add(combinedStops);
      } else if (avtovasResponse.statusCode == 200 &&
          stepanovResponse.statusCode != 200) {
        print('Stepanov request unsuccessful');
        // AVTOVAS RESPONSE CONVERT
        final avtovasJsonData = XmlConverter.xml2JsonConvert(
          response: avtovasResponse.body,
          xmlRequestName: XmlRequestName.getBusStops,
        );

        // CONVERT JSON DATA INTO STOPS LIST
        final avtovasStops = avtovasJsonData
            .map((stops) => BusStopMapper().fromJson(stops))
            .toList();

        _busStopsSubject.add(avtovasStops);
      } else if (avtovasResponse.statusCode != 200 &&
          stepanovResponse.statusCode == 200) {
        print('Avtovas request unsuccessful');
        // STEPANOV RESPONSE CONVERT
        final stepanovJsonData = XmlConverter.xml2JsonConvert(
          response: stepanovResponse.body,
          xmlRequestName: XmlRequestName.getBusStops,
        );

        // CONVERT JSON DATA INTO STOPS LIST
        final stepanovStops = stepanovJsonData
            .map((stops) => BusStopMapper().fromJson(stops))
            .toList();

        _busStopsSubject.add(stepanovStops);
      }
    } catch (e) {
      print('Caught error: $e');
    }
  }

  @override
  Future<void> getTrips({
    required String departure,
    required String destination,
    required String tripsDate,
  }) async {
    // AVTOVAS REQUEST
    final avtovasRequest = http.post(
      Uri.parse(PrivateInfo.avtovasUrl),
      headers: PrivateInfo.avtovasHeaders,
      body: XmlRequests.getTrips(
        departure: departure,
        destination: destination,
        tripsDate: tripsDate,
      ),
    );

    // STEPANOV REQUEST
    final stepanovRequest = http.post(
      Uri.parse(PrivateInfo.stepanovUrl),
      headers: PrivateInfo.stepanovHeaders,
      body: XmlRequests.getTrips(
        departure: departure,
        destination: destination,
        tripsDate: tripsDate,
      ),
    );

    // SEND BOTH REQUEST SIMULTANEOUSLY
    final responses = await Future.wait([avtovasRequest, stepanovRequest]);

    // RESPONSES
    final avtovasResponse = responses[0];
    final stepanovResponse = responses[1];

    try {
      if (avtovasResponse.statusCode == 200 &&
          stepanovResponse.statusCode == 200) {
        // AVTOVAS RESPONSE CONVERT
        final avtovasJsonData = XmlConverter.xml2JsonConvert(
          response: avtovasResponse.body,
          xmlRequestName: XmlRequestName.getTrips,
        );

        // STEPANOV RESPONSE CONVERT
        final stepanovJsonData = XmlConverter.xml2JsonConvert(
          response: stepanovResponse.body,
          xmlRequestName: XmlRequestName.getTrips,
        );

        // CONVERT BOTH JSON DATA INTO TRIP LIST
        final avtovasTrips = avtovasJsonData
            .map((trips) => TripMapper().fromJson(trips))
            .toList();
        final stepanovTrips = stepanovJsonData
            .map((trips) => TripMapper().fromJson(trips))
            .toList();

        // COMBINED 2 TRIP LIST INTO 1
        final combinedTrips = avtovasTrips + stepanovTrips;

        _tripsSubject.add(combinedTrips);
      } else if (avtovasResponse.statusCode == 200 &&
          stepanovResponse.statusCode != 200) {
        print('Stepanov request unsuccessful');
        // AVTOVAS RESPONSE CONVERT
        final avtovasJsonData = XmlConverter.xml2JsonConvert(
          response: avtovasResponse.body,
          xmlRequestName: XmlRequestName.getTrips,
        );

        // CONVERT JSON DATA INTO TRIP LIST
        final avtovasTrips = avtovasJsonData
            .map((trips) => TripMapper().fromJson(trips))
            .toList();

        _tripsSubject.add(avtovasTrips);
      } else if (avtovasResponse.statusCode != 200 &&
          stepanovResponse.statusCode == 200) {
        print('Avtovas request unsuccessful');
        // STEPANOV RESPONSE CONVERT
        final stepanovJsonData = XmlConverter.xml2JsonConvert(
          response: stepanovResponse.body,
          xmlRequestName: XmlRequestName.getTrips,
        );
        // CONVERT JSON DATA INTO TRIP LIST
        final stepanovTrips = stepanovJsonData
            .map((trips) => TripMapper().fromJson(trips))
            .toList();

        _tripsSubject.add(stepanovTrips);
      }
    } catch (e) {
      print('Caught error: $e');
    }
  }

  // @override
  // Future<void> getTrip({
  //   required String tripId,
  //   required String busStop,
  // }) async {
  //   _singleTripSubject.add([]);
  // }

  @override
  void clearBusStops() {
    _busStopsSubject.add([]);
  }

  @override
  void clearTrips() {
    _tripsSubject.add([]);
  }

  // @override
  // void clearSingleTrip() {
  //   _singleTripSubject.add([]);
  // }
}
