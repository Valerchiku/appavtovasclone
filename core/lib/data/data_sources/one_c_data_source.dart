import 'package:core/data/data_sources/interfaces/i_one_c_data_source.dart';
import 'package:core/data/mappers/bus_stop/bus_stop_mapper.dart';
import 'package:core/data/mappers/trip/trip_mapper.dart';
import 'package:core/data/utils/constants/private_info.dart';
import 'package:core/data/utils/constants/xml_request_name.dart';
import 'package:core/data/utils/xml_convertor/xml_convertor.dart';
import 'package:core/data/utils/xml_methods/xml_requests.dart';
import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

// ignore_for_file: avoid_print

final class OneCDataSource implements IOneCDataSource {
  final BehaviorSubject<List<BusStop>> _avtovasBusStopsSubject =
      BehaviorSubject();
  final BehaviorSubject<List<BusStop>> _stepanovBusStopsSubject =
      BehaviorSubject();

  final BehaviorSubject<List<Trip>> _tripsSubject = BehaviorSubject();

  bool get _tripsHasValue => _tripsSubject.hasValue;

  @override
  Stream<List<BusStop>> get avtovasBusStopsStream => _avtovasBusStopsSubject;

  @override
  Stream<List<BusStop>> get stepanovBusStopsStream => _stepanovBusStopsSubject;

  @override
  Stream<List<Trip>> get tripsStream => _tripsSubject;

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

    print('fff1');

    // RESPONSES
    final avtovasResponse = responses.first;
    final stepanovResponse = responses.last;

    try {
      if (avtovasResponse.statusCode == 200) {
        _updateAvtovasBusStopsSubject(avtovasResponse);
      }
      if (stepanovResponse.statusCode == 200) {
        _updateStepanovBusStopsSubject(stepanovResponse);
      }
      if (avtovasResponse.statusCode != 200) {
        CoreLogger.log(
          'Bad Avtovas response',
          params: {'Response status': avtovasResponse.statusCode},
        );

        _avtovasBusStopsSubject.add([]);
      }
      if (stepanovResponse.statusCode != 200) {
        CoreLogger.log(
          'Bad Stepanov response',
          params: {'Response status': stepanovResponse.statusCode},
        );

        _stepanovBusStopsSubject.add([]);
      }
    } catch (e) {
      CoreLogger.log('Caught error', params: {'Error': e});
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
    final avtovasResponse = responses.first;
    final stepanovResponse = responses.last;

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

        if (_tripsHasValue) {
          final existentCombinedTrips = [
            ..._tripsSubject.value,
            ...combinedTrips,
          ];
          _tripsSubject.add(existentCombinedTrips);
        } else {
          _tripsSubject.add(combinedTrips);
        }
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

        if (_tripsHasValue) {
          final existentCombinedTrips = [
            ..._tripsSubject.value,
            ...avtovasTrips,
          ];
          _tripsSubject.add(existentCombinedTrips);
        } else {
          _tripsSubject.add(avtovasTrips);
        }
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

        if (_tripsHasValue) {
          final existentCombinedTrips = [
            ..._tripsSubject.value,
            ...stepanovTrips,
          ];
          _tripsSubject.add(existentCombinedTrips);
        } else {
          _tripsSubject.add(stepanovTrips);
        }
      } else if (avtovasResponse.statusCode != 200 &&
          stepanovResponse.statusCode != 200) {
        clearTrips();
      }
    } catch (e) {
      clearTrips();
      print('Caught error: $e');
    }
  }

  @override
  void clearBusStops() {}

  @override
  void clearTrips() {
    _tripsSubject.add([]);
  }

  Future<void> _updateAvtovasBusStopsSubject(
    http.Response response,
  ) async {
    final avtovasJsonData = XmlConverter.xml2JsonConvert(
      response: response.body,
      xmlRequestName: XmlRequestName.getBusStops,
    );

    final avtovasStops = avtovasJsonData
        .map((stops) => BusStopMapper().fromJson(stops))
        .toList();

    print(avtovasStops);

    _avtovasBusStopsSubject.add(avtovasStops);
  }

  Future<void> _updateStepanovBusStopsSubject(
    http.Response response,
  ) async {
    final stepanovJsonData = XmlConverter.xml2JsonConvert(
      response: response.body,
      xmlRequestName: XmlRequestName.getBusStops,
    );

    final stepanovStops = stepanovJsonData
        .map((stops) => BusStopMapper().fromJson(stops))
        .toList();

    _stepanovBusStopsSubject.add(stepanovStops);
  }
}
