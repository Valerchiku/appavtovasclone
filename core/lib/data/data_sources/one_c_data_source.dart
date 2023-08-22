import 'package:core/data/data_sources/interfaces/i_one_c_data_source.dart';
import 'package:core/data/mappers/bus_stop/bus_stop_mapper.dart';
import 'package:core/data/mappers/single_trip/single_trip_mapper.dart';
import 'package:core/data/mappers/trip/trip_mapper.dart';
import 'package:core/data/utils/constants/private_info.dart';
import 'package:core/data/utils/constants/xml_request_name.dart';
import 'package:core/data/utils/xml_convertor/xml_convertor.dart';
import 'package:core/data/utils/xml_methods/xml_requests.dart';
import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

// ignore_for_file: avoid_dynamic_calls

final class OneCDataSource implements IOneCDataSource {
  final BehaviorSubject<List<BusStop>> _avtovasBusStopsSubject =
      BehaviorSubject();
  final BehaviorSubject<List<BusStop>> _stepanovBusStopsSubject =
      BehaviorSubject();
  final BehaviorSubject<List<Trip>?> _tripsSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<SingleTrip?> _singleTripSubject =
      BehaviorSubject.seeded(null);

  @override
  Stream<List<BusStop>> get avtovasBusStopsStream => _avtovasBusStopsSubject;

  @override
  Stream<List<BusStop>> get stepanovBusStopsStream => _stepanovBusStopsSubject;

  @override
  Stream<List<Trip>?> get tripsStream => _tripsSubject;

  @override
  Stream<SingleTrip?> get singleTripStream => _singleTripSubject;

  @override
  Future<void> getBusStops() async {
    // AVTOVAS REQUEST WITH TIMEOUT CHECK
    final avtovasRequest = http
        .post(
          Uri.parse(PrivateInfo.avtovasUrl),
          headers: PrivateInfo.avtovasHeaders,
          body: XmlRequests.getBusStops(),
        )
        .timeout(
          const Duration(seconds: 6),
          onTimeout: () => http.Response(
            'Error',
            408,
          ),
        );

    // STEPANOV REQUEST WITH TIMEOUT CHECK
    final stepanovRequest = http
        .post(
          Uri.parse(PrivateInfo.stepanovUrl),
          headers: PrivateInfo.stepanovHeaders,
          body: XmlRequests.getBusStops(),
        )
        .timeout(
          const Duration(seconds: 6),
          onTimeout: () => http.Response(
            'Error',
            408,
          ),
        );

    try {
      // SEND BOTH REQUEST SIMULTANEOUSLY
      final responses = await Future.wait([avtovasRequest, stepanovRequest]);
      // RESPONSES
      final avtovasResponse = responses.first;
      final stepanovResponse = responses.last;

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
      // Complete the Completers only if both requests were successful
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
    final avtovasRequest = http
        .post(
          Uri.parse(PrivateInfo.avtovasUrl),
          headers: PrivateInfo.avtovasHeaders,
          body: XmlRequests.getTrips(
            departure: departure,
            destination: destination,
            tripsDate: tripsDate,
          ),
        )
        .timeout(
          const Duration(seconds: 7),
          onTimeout: () => http.Response(
            'Error',
            408,
          ),
        );

    // STEPANOV REQUEST
    final stepanovRequest = http
        .post(
          Uri.parse(PrivateInfo.stepanovUrl),
          headers: PrivateInfo.stepanovHeaders,
          body: XmlRequests.getTrips(
            departure: departure,
            destination: destination,
            tripsDate: tripsDate,
          ),
        )
        .timeout(
          const Duration(seconds: 7),
          onTimeout: () => http.Response(
            'Error',
            408,
          ),
        );

    try {
      // SEND BOTH REQUEST SIMULTANEOUSLY
      final responses = await Future.wait([avtovasRequest, stepanovRequest]);

      // RESPONSES
      final avtovasResponse = responses.first;
      final stepanovResponse = responses.last;

      if (avtovasResponse.statusCode == 200 &&
          stepanovResponse.statusCode == 200) {
        _updateBothTripsSubject(avtovasResponse, stepanovResponse);
      }
      if (avtovasResponse.statusCode != 200 &&
          stepanovResponse.statusCode == 200) {
        CoreLogger.log(
          'Bad Avtovas response',
          params: {'Response status': avtovasResponse.statusCode},
        );

        _updateStepanovTripsSubject(stepanovResponse);
      }
      if (stepanovResponse.statusCode != 200 &&
          avtovasResponse.statusCode == 200) {
        CoreLogger.log(
          'Bad Stepanov response',
          params: {'Response status': stepanovResponse.statusCode},
        );

        _updateAvtovasTripsSubject(avtovasResponse);
      }
      if (stepanovResponse.statusCode != 200 &&
          avtovasResponse.statusCode != 200) {
        CoreLogger.log(
          'Bad Stepanov response',
          params: {'Response status': stepanovResponse.statusCode},
        );
        CoreLogger.log(
          'Bad Avtovas response',
          params: {'Response status': avtovasResponse.statusCode},
        );

        _tripsSubject.add([]);
      }
    } catch (e) {
      clearTrips();
      CoreLogger.log('Caught error', params: {'Error': e});
    }
  }

  @override
  Future<void> getTrip({
    required String tripId,
    required String busStop,
  }) async {
    // AVTOVAS REQUEST
    final avtovasRequest = http
        .post(
          Uri.parse(PrivateInfo.avtovasUrl),
          headers: PrivateInfo.avtovasHeaders,
          body: XmlRequests.getTrip(
            tripId: tripId,
            busStop: busStop,
          ),
        )
        .timeout(
          const Duration(seconds: 7),
          onTimeout: () => http.Response(
            'Error',
            408,
          ),
        );

    // STEPANOV REQUEST
    final stepanovRequest = http
        .post(
          Uri.parse(PrivateInfo.stepanovUrl),
          headers: PrivateInfo.stepanovHeaders,
          body: XmlRequests.getTrip(
            tripId: tripId,
            busStop: busStop,
          ),
        )
        .timeout(
          const Duration(seconds: 7),
          onTimeout: () => http.Response(
            'Error',
            408,
          ),
        );
    try {
      // SEND BOTH REQUEST SIMULTANEOUSLY
      final responses = await Future.wait([avtovasRequest, stepanovRequest]);

      // RESPONSES
      final avtovasResponse = responses.first;
      final stepanovResponse = responses.last;

      if (avtovasResponse.statusCode == 200) {
        _updateSingleTripSubject(avtovasResponse);
      }
      if (stepanovResponse.statusCode == 200) {
        _updateSingleTripSubject(stepanovResponse);
      }
      if (avtovasResponse.statusCode != 200) {
        CoreLogger.log(
          'Bad Avtovas response',
          params: {'Response status': avtovasResponse.statusCode},
        );
      }
      if (stepanovResponse.statusCode != 200) {
        CoreLogger.log(
          'Bad Stepanov response',
          params: {'Response status': stepanovResponse.statusCode},
        );
      }
      if (avtovasResponse.statusCode != 200 &&
          stepanovResponse.statusCode != 200) {
        CoreLogger.log(
          'Bad Avtovas response',
          params: {'Response status': avtovasResponse.statusCode},
        );
        CoreLogger.log(
          'Bad Stepanov response',
          params: {'Response status': stepanovResponse.statusCode},
        );
        _singleTripSubject.add(null);
      }
    } catch (e) {
      clearTrip();
      CoreLogger.log('Caught error', params: {'Error': e});
    }
  }

  @override
  void clearBusStops() {
    _stepanovBusStopsSubject.add([]);
    _avtovasBusStopsSubject.add([]);
  }

  @override
  void clearTrips() {
    _tripsSubject.add(null);
  }

  @override
  void clearTrip() {
    _singleTripSubject.add(null);
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

  Future<void> _updateAvtovasTripsSubject(http.Response response) async {
    final avtovasJsonData = XmlConverter.xml2JsonConvert(
      response: response.body,
      xmlRequestName: XmlRequestName.getTrips,
    );
    final avtovasTrips =
        avtovasJsonData.map((trips) => TripMapper().fromJson(trips)).toList();

    _tripsSubject.add(avtovasTrips);
  }

  Future<void> _updateStepanovTripsSubject(http.Response response) async {
    final stepanovJsonData = XmlConverter.xml2JsonConvert(
      response: response.body,
      xmlRequestName: XmlRequestName.getTrips,
    );
    final stepanovTrips =
        stepanovJsonData.map((trips) => TripMapper().fromJson(trips)).toList();

    _tripsSubject.add(stepanovTrips);
  }

  Future<void> _updateBothTripsSubject(
    http.Response avtovasResponse,
    http.Response stepanovResponse,
  ) async {
    // AVTOVAS
    final avtovasJsonData = XmlConverter.xml2JsonConvert(
      response: avtovasResponse.body,
      xmlRequestName: XmlRequestName.getTrips,
    );
    final avtovasTrips =
        avtovasJsonData.map((trips) => TripMapper().fromJson(trips)).toList();

    // STEPANOV
    final stepanovJsonData = XmlConverter.xml2JsonConvert(
      response: stepanovResponse.body,
      xmlRequestName: XmlRequestName.getTrips,
    );
    final stepanovTrips =
        stepanovJsonData.map((trips) => TripMapper().fromJson(trips)).toList();

    final existentCombinedTrips = [
      ...avtovasTrips,
      ...stepanovTrips,
    ];

    _tripsSubject.add(existentCombinedTrips);
  }

  Future<void> _updateSingleTripSubject(http.Response response) async {
    final jsonData = XmlConverter.packageXmlConverter(xml: response.body);
    final jsonPath =
        jsonData['soap:Envelope']['soap:Body']['m:GetTripResponse']['m:return'];

    final singleTrip = SingleTripMapper().fromJson(jsonPath);

    _singleTripSubject.add(singleTrip);
  }
}
