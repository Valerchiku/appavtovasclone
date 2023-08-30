import 'dart:convert';

import 'package:core/data/data_sources/interfaces/i_one_c_data_source.dart';
import 'package:core/data/mappers/bus_stop/bus_stop_mapper.dart';
import 'package:core/data/mappers/occupied_seat_mapper/occupied_seat_mapper.dart';
import 'package:core/data/mappers/single_trip/single_trip_mapper.dart';
import 'package:core/data/mappers/start_sale_session/start_sale_session_mapper.dart';
import 'package:core/data/mappers/trip/trip_mapper.dart';
import 'package:core/data/utils/constants/private_info.dart';
import 'package:core/data/utils/constants/xml_request_name.dart';
import 'package:core/data/utils/xml_convertor/xml_convertor.dart';
import 'package:core/data/utils/xml_methods/xml_requests.dart';
import 'package:core/domain/entities/add_tickets/add_tickets.dart';
import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

// ignore_for_file: avoid_dynamic_calls

final class OneCDataSource implements IOneCDataSource {
  final BehaviorSubject<List<BusStop>?> _busStopsSubject = BehaviorSubject();
  final BehaviorSubject<List<Trip>?> _tripsSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<SingleTrip?> _singleTripSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<StartSaleSession?> _saleSessionSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<List<OccupiedSeat>?> _occupiedSeatSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<AddTickets?> _addTicketSubject =
      BehaviorSubject.seeded(null);

  bool get _busStopsHasValue => _busStopsSubject.hasValue;

  bool get _tripsHasValue => _tripsSubject.value != null;

  bool get _singleTripHasValue => _singleTripSubject.value != null;

  bool get _saleSessionSubjectHasValue => _saleSessionSubject.value != null;

  bool get _occupiedSeatSubjectHasValue => _occupiedSeatSubject.value != null;

  bool get _addTicketSubjectHasValue => _addTicketSubject.value != null;

  @override
  Stream<List<BusStop>?> get busStopsStream => _busStopsSubject;

  @override
  Stream<List<Trip>?> get tripsStream => _tripsSubject;

  @override
  Stream<SingleTrip?> get singleTripStream => _singleTripSubject;

  @override
  Stream<StartSaleSession?> get saleSessionStream => _saleSessionSubject;

  @override
  Stream<List<OccupiedSeat>?> get occupiedSeat => _occupiedSeatSubject;

  @override
  Stream<AddTickets?> get addTicketsStream => _addTicketSubject;

  @override
  Future<void> getBusStops() async {
    for (final request in PrivateInfo.dbInfo) {
      http
          .post(
        Uri.parse(request.url),
        headers: request.header,
        body: XmlRequests.getBusStops(),
      )
          .then(
        (value) {
          try {
            _updateBusStopsSubject(value, request.dbName);
          } catch (e) {
            CoreLogger.log(
              'Caught exception',
              params: {'Exception': e},
            );
          }
        },
      );
    }
  }

  @override
  Future<void> getTrips({
    required String departure,
    required String destination,
    required String tripsDate,
  }) async {
    for (final request in PrivateInfo.dbInfo) {
      http
          .post(
        Uri.parse(request.url),
        headers: request.header,
        body: XmlRequests.getTrips(
          departure: departure,
          destination: destination,
          tripsDate: tripsDate,
        ),
      )
          .then(
        (value) {
          try {
            _updateTripsSubject(value, request.dbName);
          } catch (e) {
            CoreLogger.log(
              'Caught exception',
              params: {'Exception': e},
            );
          }
        },
      );
    }
  }

  @override
  Future<void> getTrip({
    required String tripId,
    required String busStop,
  }) async {
    for (final request in PrivateInfo.dbInfo) {
      http
          .post(
        Uri.parse(request.url),
        headers: request.header,
        body: XmlRequests.getTrip(
          tripId: tripId,
          busStop: busStop,
        ),
      )
          .then(
        (value) {
          try {
            _updateSingleTripSubject(value, request.dbName);
          } catch (e) {
            CoreLogger.log(
              'Caught exception',
              params: {'Exception': e},
            );
          }
        },
      );
    }
  }

  @override
  Future<void> startSaleSession({
    required String tripId,
    required String departure,
    required String destination,
  }) async {
    for (final request in PrivateInfo.dbInfo) {
      http
          .post(
        Uri.parse(request.url),
        headers: request.header,
        body: XmlRequests.startSaleSession(
          tripId: tripId,
          departure: departure,
          destination: destination,
        ),
      )
          .then(
        (value) {
          try {
            _updateSaleSessionSubject(value, request.dbName);
          } catch (e) {
            CoreLogger.log(
              'Caught exception',
              params: {'Exception': e},
            );
          }
        },
      );
    }
  }

  @override
  Future<void> getOccupiedSeat({
    required String tripId,
    required String departure,
    required String destination,
  }) async {
    for (final request in PrivateInfo.dbInfo) {
      http
          .post(
        Uri.parse(request.url),
        headers: request.header,
        body: XmlRequests.getOccupiedSeats(
          tripId: tripId,
          departure: departure,
          destination: destination,
        ),
      )
          .then(
        (value) {
          try {
            _updateOccupiedSeatSubject(value, request.dbName);
          } catch (e) {
            CoreLogger.log(
              'Caught exception',
              params: {'Exception': e},
            );
          }
        },
      );
    }
  }

  @override
  Future<void> addTickets({
    required String orderId,
    required String fareName,
    required String seatNum,
    String? parentTicketSeatNum,
  }) async {
    for (final request in PrivateInfo.dbInfo) {
      http
          .post(
        Uri.parse(request.url),
        headers: request.header,
        body: XmlRequests.addTickets(
          orderId: orderId,
          fareName: fareName,
          seatNum: seatNum,
          parentTicketSeatNum: parentTicketSeatNum,
        ),
      )
          .then(
        (value) {
          try {
            _updateAddTicketsSubject(value, request.dbName);
          } catch (e) {
            CoreLogger.log(
              'Caught exception',
              params: {'Exception': e},
            );
          }
        },
      );
    }
  }

  @override
  void clearBusStop() {
    _busStopsSubject.add([]);
  }

  @override
  void clearTrips() {
    _tripsSubject.add(null);
  }

  @override
  void clearTrip() {
    _singleTripSubject.add(null);
  }

  @override
  void clearSession() {
    _saleSessionSubject.add(null);
  }

  @override
  void clearOccupiedSeat() {
    _occupiedSeatSubject.add(null);
  }

  @override
  void clearAddTickets() {
    _addTicketSubject.add(null);
  }

  Future<void> _updateBusStopsSubject(
    http.Response response,
    String dbName,
  ) async {
    if (response.statusCode == 200) {
      final jsonData = XmlConverter.xml2JsonConvert(
        response: response.body,
        xmlRequestName: XmlRequestName.getBusStops,
      );

      final busStops =
          jsonData.map((stops) => BusStopMapper().fromJson(stops)).toList();

      // CoreLogger.log(
      //   'Good status',
      //   params: {'$dbName response ': response.statusCode},
      // );

      if (_busStopsHasValue) {
        final existentCombinedTrips = [
          ..._busStopsSubject.value!,
          ...busStops,
        ];
        _busStopsSubject.add(existentCombinedTrips);
      } else {
        _busStopsSubject.add(busStops);
      }
    } else {
      if (_busStopsHasValue) {
        final existentCombinedTrips = [
          ..._busStopsSubject.value!,
          ...<BusStop>[],
        ];
        CoreLogger.log(
          'Bad elements',
          params: {'$dbName response ': response.statusCode},
        );
        _busStopsSubject.add(existentCombinedTrips);
      } else {
        _busStopsSubject.add([]);
      }
    }
  }

  Future<void> _updateTripsSubject(
    http.Response response,
    String dbName,
  ) async {
    if (response.statusCode == 200) {
      final jsonData = XmlConverter.xml2JsonConvert(
        response: response.body,
        xmlRequestName: XmlRequestName.getTrips,
      );

      final trip =
          jsonData.map((trips) => TripMapper().fromJson(trips)).toList();

      CoreLogger.log(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );
      if (_tripsHasValue) {
        final existentCombinedTrips = [
          ..._tripsSubject.value!,
          ...trip,
        ];

        _tripsSubject.add(existentCombinedTrips);
      } else {
        _tripsSubject.add(trip);
      }
    } else {
      CoreLogger.log(
        'Bad elements',
        params: {'$dbName response ': response.statusCode},
      );
      if (_tripsHasValue) {
        final existentCombinedTrips = [
          ..._tripsSubject.value!,
          ...<Trip>[],
        ];
        _tripsSubject.add(existentCombinedTrips);
      } else {
        _tripsSubject.add([]);
      }
    }
  }

  Future<void> _updateSingleTripSubject(
    http.Response response,
    String dbName,
  ) async {
    if (response.statusCode == 200) {
      final jsonData = XmlConverter.packageXmlConverter(xml: response.body);
      final jsonPath = jsonData['soap:Envelope']['soap:Body']
          ['m:GetTripResponse']['m:return'];

      final singleTrip = SingleTripMapper().fromJson(jsonPath);
      CoreLogger.log(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );
      _singleTripSubject.add(singleTrip);
    } else {
      CoreLogger.log(
        'Bad elements',
        params: {'$dbName response ': response.statusCode},
      );
      if (_singleTripHasValue) {
        _singleTripSubject.add(null);
      }
    }
  }

  Future<void> _updateSaleSessionSubject(
    http.Response response,
    String dbName,
  ) async {
    if (response.statusCode == 200) {
      final jsonData = XmlConverter.packageXmlConverter(xml: response.body);

      final jsonPath = jsonData['soap:Envelope']['soap:Body']
          ['m:StartSaleSessionResponse']['m:return'];

      final saleSession = StartSaleSessionMapper().fromJson(jsonPath);
      CoreLogger.log('$saleSession');
      CoreLogger.log(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );
      _saleSessionSubject.add(saleSession);
    } else {
      CoreLogger.log(
        'Bad elements',
        params: {'$dbName response ': response.statusCode},
      );
      if (!_saleSessionSubjectHasValue) {
        _saleSessionSubject.add(null);
      }
    }
  }

  Future<void> _updateOccupiedSeatSubject(
    http.Response response,
    String dbName,
  ) async {
    if (response.statusCode == 200) {
      final jsonData = XmlConverter.packageXmlConverter(xml: response.body);
      final returnPath = jsonData['soap:Envelope']['soap:Body']
          ['m:GetOccupiedSeatsResponse']['m:return'];

      if (returnPath == null) {
        _occupiedSeatSubject.add([]);
      } else {
        final List jsonPath = returnPath['Elements'];

        final occupiedSeat = jsonPath
            .map((seat) => OccupiedSeatMapper().fromJson(seat))
            .toList();

        CoreLogger.log(
          'Good status',
          params: {'$dbName response ': response.statusCode},
        );
        _occupiedSeatSubject.add(occupiedSeat);
      }
    } else {
      CoreLogger.log(
        'Bad elements',
        params: {'$dbName response ': response.statusCode},
      );
      if (!_occupiedSeatSubjectHasValue) {
        _occupiedSeatSubject.add(null);
      }
    }
  }

  Future<void> _updateAddTicketsSubject(
    http.Response response,
    String dbName,
  ) async {
    final jsonData = XmlConverter.packageXmlConverter(xml: response.body);
    final jsonPath = jsonData['soap:Envelope']['soap:Body'];
    CoreLogger.log(
        'TEST ${jsonData['soap:Envelope']['soap:Body']}');
    /*
    // CoreLogger.log(response.body);
    // if (response.statusCode == 200) {
      
    final jsonData = XmlConverter.packageXmlConverter(xml: response.body);

    final jsonPath = jsonData['soap:Envelope']['soap:Body'];

    // final addTicket = AddTicketsMapper().fromJson(jsonPath);

    CoreLogger.log('$jsonPath');
    CoreLogger.log(
      'Good status',
      params: {'$dbName response ': response.statusCode},
    );
    // _saleSessionSubject.add(saleSession);
    // } else {
    //   CoreLogger.log(
    //     'Bad elements',
    //     params: {'$dbName response ': response.statusCode},
    //   );
    //   // if (_saleSessionSubjectHasValue) {
    //   //   _saleSessionSubject.add(null);
    //   // }
    // } 
    */
  }
}
