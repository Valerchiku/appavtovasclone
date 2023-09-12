import 'package:core/avtovas_core.dart';
import 'package:core/data/mappers/add_ticket/add_ticket_mapper.dart';
import 'package:core/data/mappers/bus_stop/bus_stop_mapper.dart';
import 'package:core/data/mappers/occupied_seat_mapper/occupied_seat_mapper.dart';
import 'package:core/data/mappers/reserve_order_mapper/reserve_order_mapper.dart';
import 'package:core/data/mappers/set_ticket_data_mapper/set_ticket_data_mapper.dart';
import 'package:core/data/mappers/single_trip/single_trip_mapper.dart';
import 'package:core/data/mappers/start_sale_session/start_sale_session_mapper.dart';
import 'package:core/data/mappers/trip/trip_mapper.dart';
import 'package:core/data/utils/constants/xml_request_name.dart';
import 'package:core/data/utils/xml_convertor/xml_convertor.dart';
import 'package:core/data/utils/xml_methods/xml_requests.dart';
import 'package:core/domain/entities/add_ticket_return/add_ticket_return.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/payment/payment.dart';
import 'package:core/domain/entities/return_payment/return_payment.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

// ignore_for_file: avoid_dynamic_calls

final class OneCDataSource implements IOneCDataSource {
  OneCDataSource() {
    _initializeConnectionPull();
    _initializeTripsSubjectsList();
  }

  late final List<http.Client> _connectionPulls;

  final BehaviorSubject<List<BusStop>?> _busStopsSubject = BehaviorSubject();
  final BehaviorSubject<List<Trip>?> _tripsSubject =
      BehaviorSubject.seeded(null);
  late final List<BehaviorSubject<List<Trip>?>> _tripsSubjectsList;
  final BehaviorSubject<SingleTrip?> _singleTripSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<StartSaleSession?> _saleSessionSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<List<OccupiedSeat>?> _occupiedSeatSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<AddTicket?> _addTicketSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<SetTicketData?> _setTicketDataSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<ReserveOrder?> _reserveOrderSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<Payment?> _paymentSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<AddTicketReturn?> _addTicketReturnSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<ReturnPayment?> _returnPaymentSubject =
      BehaviorSubject.seeded(null);

  bool get _busStopsHasValue => _busStopsSubject.hasValue;

  bool get _singleTripHasValue => _singleTripSubject.value != null;

  bool get _saleSessionSubjectHasValue => _saleSessionSubject.value != null;

  bool get _occupiedSeatSubjectHasValue => _occupiedSeatSubject.value != null;

  bool get _addTicketSubjectHasValue => _addTicketSubject.value != null;

  bool get _setTicketDataSubjectHasValue => _setTicketDataSubject.value != null;

  bool get _reserveOrderSubjectHasValue => _reserveOrderSubject.value != null;

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
  Stream<AddTicket?> get addTicketsStream => _addTicketSubject;

  @override
  Stream<SetTicketData?> get setTicketDataStream => _setTicketDataSubject;

  @override
  Stream<ReserveOrder?> get reserveOrderStream => _reserveOrderSubject;

  @override
  Stream<Payment?> get paymentStream => _paymentSubject;

  @override
  Stream<AddTicketReturn?> get addTicketReturnStream => _addTicketReturnSubject;

  @override
  Stream<ReturnPayment?> get returnPaymentStream => _returnPaymentSubject;

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
    _clearTripsSubjects();

    for (var index = 0; index < PrivateInfo.dbInfo.length; index++) {
      final request = PrivateInfo.dbInfo[index];

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
            _updateTripsSubject(
              value,
              request.dbName,
              subjectIndex: index,
            );
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
    required List<AuxiliaryAddTicket> auxiliaryAddTicket,
    required String orderId,
    String? parentTicketSeatNum,
  }) async {
    for (final request in PrivateInfo.dbInfo) {
      http
          .post(
        Uri.parse(request.url),
        headers: request.header,
        body: XmlRequests.addTicket(
          auxiliaryAddTicket: auxiliaryAddTicket,
          orderId: orderId,
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
  Future<void> setTicketData({
    required String orderId,
    required List<PersonalData> personalData,
  }) async {
    for (final request in PrivateInfo.dbInfo) {
      http
          .post(
        Uri.parse(request.url),
        headers: request.header,
        body: XmlRequests.setTicketData(
          orderId: orderId,
          personalData: personalData,
        ),
      )
          .then(
        (value) {
          try {
            _updateSetTicketDataSubject(value, request.dbName);
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
  Future<void> reserveOrder({
    required String orderId,
    String? name,
    String? phone,
    String? email,
    String? comment,
  }) async {
    for (final request in PrivateInfo.dbInfo) {
      http
          .post(
        Uri.parse(request.url),
        headers: request.header,
        body: XmlRequests.reserveOrder(
          orderId: orderId,
          name: name,
          phone: phone,
          email: email,
          comment: comment,
        ),
      )
          .then(
        (value) {
          try {
            _updateReserveOrderSubject(value, request.dbName);
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
  Future<void> payment({
    required String orderId,
    required String paymentType,
    required String amount,
    String? terminalId,
    String? terminalSessionId,
  }) async {
    for (final request in PrivateInfo.dbInfo) {
      http
          .post(
        Uri.parse(request.url),
        headers: request.header,
        body: XmlRequests.payment(
          orderId: orderId,
          paymentType: paymentType,
          amount: amount,
          terminalId: terminalId,
          terminalSessionId: terminalSessionId,
        ),
      )
          .then(
        (value) {
          try {
            _updatePaymentSubject(value, request.dbName);
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
  Future<void> addTicketReturn({
    required String ticketNumber,
    required String seatNum,
    required String departure,
  }) async {
    for (final request in PrivateInfo.dbInfo) {
      http
          .post(
        Uri.parse(request.url),
        headers: request.header,
        body: XmlRequests.addTicketReturn(
          ticketNumber: ticketNumber,
          seatNum: seatNum,
          departure: departure,
        ),
      )
          .then(
        (value) {
          try {
            _updateAddTicketReturnSubject(value, request.dbName);
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
  Future<void> returnPayment({
    required String returnOrderId,
    required String paymentType,
    required String amount,
    String? terminalId,
    String? terminalSessionId,
  }) async {
    for (final request in PrivateInfo.dbInfo) {
      http
          .post(
        Uri.parse(request.url),
        headers: request.header,
        body: XmlRequests.returnPayment(
          returnOrderId: returnOrderId,
          paymentType: paymentType,
          amount: amount,
        ),
      )
          .then(
        (value) {
          try {
            _updateReturnPaymentSubject(value, request.dbName);
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

  @override
  void clearSetTicketData() {
    _setTicketDataSubject.add(null);
  }

  @override
  void clearReserveOrder() {
    _reserveOrderSubject.add(null);
  }

  @override
  void clearPayment() {
    _paymentSubject.add(null);
  }

  @override
  void clearAddTicketReturn() {
    _addTicketReturnSubject.add(null);
  }

  @override
  void clearReturnPayment() {
    _returnPaymentSubject.add(null);
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

      CoreLogger.log(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );

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

  void _updateTripsSubject(
    http.Response response,
    String dbName, {
    required int subjectIndex,
  }) {
    if (response.statusCode == 200) {
      final jsonData = XmlConverter.xml2JsonConvert(
        response: response.body,
        xmlRequestName: XmlRequestName.getTrips,
      );

      final trips =
          jsonData.map((trips) => TripMapper().fromJson(trips)).toList();

      CoreLogger.log(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );

      _tripsSubjectsList[subjectIndex].add(trips);
    } else {
      CoreLogger.log(
        'Bad elements',
        params: {'$dbName response ': response.statusCode},
      );

      _tripsSubjectsList[subjectIndex].add([]);
    }

    if (!_tripsSubjectsList.map((e) => e.value).toList().contains(null)) {
      final combinedTrips =
          _tripsSubjectsList.map((subject) => subject.value!).toList();

      _tripsSubject.add(combinedTrips.expand((trips) => trips).toList());
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
        final jsonPath = returnPath['Elements'];

        final occupiedSeat = <OccupiedSeat>[];

        if (jsonPath is Map<String, dynamic>) {
          occupiedSeat.add(
            OccupiedSeatMapper().fromJson(jsonPath),
          );
        } else if (jsonPath is List<dynamic>) {
          occupiedSeat.addAll(
            jsonPath.map(
              (el) => OccupiedSeatMapper().fromJson(
                el as Map<String, dynamic>,
              ),
            ),
          );
        }

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
    if (response.statusCode == 200) {
      final jsonData = XmlConverter.packageXmlConverter(xml: response.body);

      final jsonPath = jsonData['soap:Envelope']['soap:Body']
          ['m:AddTicketsResponse']['m:return'];
      final tickets = AddTicketMapper().fromJson(jsonPath);
      CoreLogger.log(
        'ORDER ID: ${tickets.number} TICKET ID: ${tickets.tickets[0].number}',
      );
      CoreLogger.log(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );
      _addTicketSubject.add(tickets);
    } else {
      CoreLogger.log(
        'Bad elements',
        params: {'$dbName response ': response.statusCode},
      );
      if (!_addTicketSubjectHasValue) {
        _addTicketSubject.add(null);
      }
    }
  }

  Future<void> _updateSetTicketDataSubject(
    http.Response response,
    String dbName,
  ) async {
    if (response.statusCode == 200) {
      final jsonData = XmlConverter.packageXmlConverter(xml: response.body);

      final jsonPath = jsonData['soap:Envelope']['soap:Body']
          ['m:SetTicketDataResponse']['m:return'];
      final ticketData = SetTicketDataMapper().fromJson(jsonPath);
      CoreLogger.log(
        'Data Set',
        params: {'$dbName response ': response.statusCode},
      );
      _setTicketDataSubject.add(ticketData);
    } else {
      CoreLogger.log(
        'Bad elements',
        params: {'$dbName response ': response.statusCode},
      );
      if (!_setTicketDataSubjectHasValue) {
        _setTicketDataSubject.add(null);
      }
    }
  }

  Future<void> _updateReserveOrderSubject(
    http.Response response,
    String dbName,
  ) async {
    if (response.statusCode == 200) {
      final jsonData = XmlConverter.packageXmlConverter(xml: response.body);

      final jsonPath = jsonData['soap:Envelope']['soap:Body']
          ['m:ReserveOrderResponse']['m:return'];

      final reserveOrder = ReserveOrderMapper().fromJson(jsonPath);

      CoreLogger.log(
        'Ticket reserved',
        params: {'$dbName response ': response.statusCode},
      );
      _reserveOrderSubject.add(reserveOrder);
    } else {
      CoreLogger.log(
        'Bad elements',
        params: {'$dbName response ': response.statusCode},
      );
      if (!_reserveOrderSubjectHasValue) {
        _reserveOrderSubject.add(null);
      }
    }
  }

  Future<void> _updatePaymentSubject(
    http.Response response,
    String dbName,
  ) async {
    if (response.statusCode == 200) {
      CoreLogger.log(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );
    } else {
      CoreLogger.log(
        'Bad elements',
        params: {'$dbName response ': response.statusCode},
      );
    }
  }

  Future<void> _updateAddTicketReturnSubject(
    http.Response response,
    String dbName,
  ) async {
    if (response.statusCode == 200) {
      CoreLogger.log(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );
    } else {
      CoreLogger.log(
        'Bad elements',
        params: {'$dbName response ': response.statusCode},
      );
    }
  }

  Future<void> _updateReturnPaymentSubject(
    http.Response response,
    String dbName,
  ) async {
    if (response.statusCode == 200) {
      CoreLogger.log(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );
    } else {
      CoreLogger.log(
        'Bad elements',
        params: {'$dbName response ': response.statusCode},
      );
    }
  }

  void _initializeTripsSubjectsList() {
    _tripsSubjectsList = List.generate(
      PrivateInfo.dbInfo.length,
      (index) => BehaviorSubject.seeded(null),
    );
  }

  void _clearTripsSubjects() {
    for (final subject in _tripsSubjectsList) {
      subject.add(null);
    }
  }

  void _initializeConnectionPull() {
    _connectionPulls = [];

    for (final privateInfo in PrivateInfo.dbInfo) {
      _connectionPulls.add(
        http.Client()
          ..head(
            Uri.parse(privateInfo.url),
            headers: privateInfo.header,
          ),
      );
    }
  }
}
