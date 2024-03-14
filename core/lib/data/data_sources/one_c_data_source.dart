import 'dart:async';
import 'dart:convert';

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
import 'package:core/domain/entities/avibus/avibus.dart';
import 'package:core/domain/entities/db_info/db_info.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/one_c_payment/one_c_payment.dart';
import 'package:core/domain/entities/return_one_c_payment/return_one_c_payment.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:xml/xml.dart';

// ignore_for_file: avoid_dynamic_calls

final class OneCDataSource implements IOneCDataSource {
  final IAvibusSettingsDataSource _avibusSettingsDataSource;

  OneCDataSource(this._avibusSettingsDataSource) {
    _initializeAvibusSettings();
  }

  StreamSubscription<List<Avibus>>? _avibusSettingsSubscription;

  Stream<List<Avibus>> get _avibusSettingsStream =>
      _avibusSettingsDataSource.avibusSettingsStream;

  List<Avibus> _avibusSettings = [];
  List<DbInfo> _avibusDbInfo = [];

  List<BehaviorSubject<List<Trip>?>>? _tripsSubjectsList;

  final BehaviorSubject<List<BusStop>?> _busStopsSubject = BehaviorSubject();
  final BehaviorSubject<List<Trip>?> _tripsSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<(SingleTrip?, bool)> _singleTripSubject =
      BehaviorSubject.seeded((null, false));
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

  final BehaviorSubject<OneCPayment?> _oneCPaymentSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<AddTicketReturn?> _addTicketReturnSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<ReturnOneCPayment?> _returnOneCPaymentSubject =
      BehaviorSubject.seeded(null);

  final BehaviorSubject<bool> _initializationStatusSubject =
      BehaviorSubject.seeded(false);

  bool get _busStopsHasValue => _busStopsSubject.hasValue;

  bool get _singleTripHasValue => _singleTripSubject.value.$1 != null;

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
  Stream<(SingleTrip?, bool)> get singleTripStream => _singleTripSubject;

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
  Stream<OneCPayment?> get oneCPaymentStream => _oneCPaymentSubject;

  @override
  Stream<AddTicketReturn?> get addTicketReturnStream => _addTicketReturnSubject;

  @override
  Stream<bool> get initializationStatusStream => _initializationStatusSubject;

  @override
  Stream<ReturnOneCPayment?> get returnOneCPaymentStream =>
      _returnOneCPaymentSubject;

  String _lastFoundedDbName = '';

  @override
  String get dbName => _lastFoundedDbName;

  void _initializeAvibusSettings() {
    _avibusSettingsSubscription?.cancel();
    _avibusSettingsSubscription = null;
    _avibusSettingsSubscription = _avibusSettingsStream.listen(
      (settings) {
        _avibusSettings = settings;
        _initializeDatabaseInformation();
        _initializeTripsSubjectsList();
        getBusStops();
      },
    );
  }

  @override
  Future<void> getBusStops() async {
    for (final request in _avibusDbInfo) {
      try {
        final response = await http.post(
          Uri.parse(request.url),
          headers: request.header,
          body: XmlRequests.getBusStops(),
        );

        await _updateBusStopsSubject(response, request.dbName);
      } catch (e) {
        CoreLogger.infoLog(
          'Caught exception',
          params: {'Exception': e},
        );
      }
    }
  }

  @override
  Future<void> getTrips({
    required String departure,
    required String destination,
    required String tripsDate,
  }) async {
    _clearTripsSubjects();

    for (var index = 0; index < _avibusDbInfo.length; index++) {
      final request = _avibusDbInfo[index];

      try {
        final response = await http.post(
          Uri.parse(request.url),
          headers: request.header,
          body: XmlRequests.getTrips(
            departure: departure,
            destination: destination,
            tripsDate: tripsDate,
          ),
        );

        _updateTripsSubject(
          response,
          request.dbName,
          subjectIndex: index,
        );
      } catch (e) {
        CoreLogger.errorLog(
          'Caught exception',
          params: {'Exception': e},
        );

        _tripsSubjectsList![index].add([]);
      }

      if (!_tripsSubjectsList!.map((e) => e.value).toList().contains(null)) {
        final combinedTrips =
            _tripsSubjectsList!.map((subject) => subject.value!).toList();

        _tripsSubject.add(combinedTrips.expand((trips) => trips).toList());
      }
    }
  }

  @override
  Future<void> getTrip({
    required String tripId,
    required String departure,
    required String destination,
  }) async {
    for (var index = 0; index < _avibusDbInfo.length; index++) {
      final request = _avibusDbInfo[index];

      try {
        final response = await http.post(
          Uri.parse(request.url),
          headers: request.header,
          body: XmlRequests.getTrip(
            tripId: tripId,
            departure: departure,
            destination: destination,
          ),
        );

        if (await _updateSingleTripSubject(response, request.dbName, index)) {
          break;
        }
      } catch (e) {
        CoreLogger.infoLog(
          'Caught exception',
          params: {'Exception': e},
        );
      }
    }
  }

  @override
  Future<void> startSaleSession({
    required String tripId,
    required String departure,
    required String destination,
  }) async {
    final requestDbInfo = _avibusDbInfo.firstWhere(
      (e) => e.dbName == _lastFoundedDbName,
    );

    http
        .post(
      Uri.parse(requestDbInfo.url),
      headers: requestDbInfo.header,
      body: XmlRequests.startSaleSession(
        tripId: tripId,
        departure: departure,
        destination: destination,
      ),
    )
        .then(
      (value) {
        try {
          _updateSaleSessionSubject(value, requestDbInfo.dbName);
        } catch (e) {
          CoreLogger.infoLog(
            'Caught exception',
            params: {'Exception': e},
          );
        }
      },
    );
  }

  @override
  Future<void> getOccupiedSeat({
    required String tripId,
    required String departure,
    required String destination,
  }) async {
    final requestDbInfo = _avibusDbInfo.firstWhere(
      (e) => e.dbName == _lastFoundedDbName,
    );

    http
        .post(
      Uri.parse(requestDbInfo.url),
      headers: requestDbInfo.header,
      body: XmlRequests.getOccupiedSeats(
        tripId: tripId,
        departure: departure,
        destination: destination,
      ),
    )
        .then(
      (value) {
        try {
          _updateOccupiedSeatSubject(value, requestDbInfo.dbName);
        } catch (e) {
          CoreLogger.infoLog(
            'Caught exception',
            params: {'Exception': e},
          );
        }
      },
    );
  }

  @override
  Future<void> delTickets({
    required List<AuxiliaryAddTicket> auxiliaryAddTicket,
    required String orderId,
  }) async {
    for (final request in _avibusDbInfo) {
      http.post(
        Uri.parse(request.url),
        headers: request.header,
        body: XmlRequests.delTickets(
          auxiliaryAddTicket: auxiliaryAddTicket,
          orderId: orderId,
        ),
      );
    }
  }

  @override
  Future<void> addTickets({
    required List<AuxiliaryAddTicket> auxiliaryAddTicket,
    required String orderId,
    String? parentTicketSeatNum,
  }) async {
    final requestDbInfo = _avibusDbInfo.firstWhere(
      (e) => e.dbName == _lastFoundedDbName,
    );

    http
        .post(
      Uri.parse(requestDbInfo.url),
      headers: requestDbInfo.header,
      body: XmlRequests.addTickets(
        auxiliaryAddTicket: auxiliaryAddTicket,
        orderId: orderId,
        parentTicketSeatNum: parentTicketSeatNum,
      ),
    )
        .then(
      (value) {
        try {
          _updateAddTicketsSubject(value, requestDbInfo.dbName);
        } catch (e) {
          CoreLogger.infoLog(
            'Caught exception',
            params: {'Exception': e},
          );
        }
      },
    );
  }

  @override
  Future<String> setTicketData({
    required String orderId,
    required List<PersonalData> personalData,
  }) async {
    final requestDbInfo = _avibusDbInfo.firstWhere(
      (e) => e.dbName == _lastFoundedDbName,
    );

    CoreLogger.infoLog('$personalData');

    try {
      final response = await http.post(
        Uri.parse(requestDbInfo.url),
        headers: requestDbInfo.header,
        body: XmlRequests.setTicketData(
          orderId: orderId,
          personalData: personalData,
        ),
      );

      return _updateSetTicketDataSubject(response, requestDbInfo.dbName);
    } catch (e) {
      CoreLogger.infoLog(
        'Caught exception',
        params: {'Exception': e},
      );

      return 'error';
    }
  }

  @override
  Future<void> reserveOrder({
    required String orderId,
    required String name,
    required String phone,
    required String email,
    required String comment,
  }) async {
    final requestDbInfo = _avibusDbInfo.firstWhere(
      (e) => e.dbName == _lastFoundedDbName,
    );

    try {
      final reserveKind = _avibusSettings
          .firstWhere(
            (e) => e.dbName == _lastFoundedDbName,
          )
          .reserveKind;

      final response = await http.post(
        Uri.parse(requestDbInfo.url),
        headers: requestDbInfo.header,
        body: XmlRequests.reserveOrder(
          orderId: orderId,
          name: name,
          phone: phone,
          email: email,
          comment: comment,
          reserveKind: reserveKind,
        ),
      );

      _updateReserveOrderSubject(response, requestDbInfo.dbName);
    } catch (e) {
      CoreLogger.infoLog(
        'Caught exception',
        params: {'Exception': e},
      );
    }
  }

  @override
  Future<String> oneCPayment({
    required String dbName,
    required String orderId,
    required String paymentType,
    required String amount,
    String? terminalId,
    String? terminalSessionId,
  }) async {
    final dbInfo = _avibusDbInfo.firstWhere((e) => e.dbName == dbName);

    final response = await http.post(
      Uri.parse(dbInfo.url),
      headers: dbInfo.header,
      body: XmlRequests.oneCPayment(
        orderId: orderId,
        paymentType: paymentType,
        amount: amount,
        terminalId: terminalId,
        terminalSessionId: terminalSessionId,
      ),
    );

    try {
      return _updateOneCPaymentSubject(response, dbName);
    } catch (e) {
      CoreLogger.errorLog(
        'Caught exception',
        params: {'Exception': e},
      );

      return 'error';
    }
  }

  @override
  Future<String> oneCCancelPayment({
    required String dbName,
    required String orderId,
    String? ticketSeats,
    String? services,
    String? paymentItems,
  }) async {
    final dbInfo = _avibusDbInfo.firstWhere((e) => e.dbName == dbName);

    final response = await http.post(
      Uri.parse(dbInfo.url),
      headers: dbInfo.header,
      body: XmlRequests.cancelPayment(
        orderId: orderId,
      ),
    );

    try {
      return _updateCancelPaymentSubject(response, dbName);
    } catch (e) {
      CoreLogger.errorLog(
        'Caught exception',
        params: {'Exception': e},
      );

      return 'error';
    }
  }

  @override
  Future<String> addTicketReturn({
    required String dbName,
    required String ticketNumber,
    required String seatNum,
    required String departure,
  }) async {
    final dbInfo = _avibusDbInfo.firstWhere((e) => e.dbName == dbName);

    final response = await http.post(
      Uri.parse(dbInfo.url),
      headers: dbInfo.header,
      body: XmlRequests.addTicketReturn(
        ticketNumber: ticketNumber,
        seatNum: seatNum,
        departure: departure,
      ),
    );

    try {
      return _updateAddTicketReturnSubject(response, dbName);
    } catch (e) {
      CoreLogger.errorLog(
        'Caught exception',
        params: {'Exception': e},
      );

      return 'error';
    }
  }

  @override
  Future<String> returnOneCPayment({
    required String dbName,
    required String returnOrderId,
    required String paymentType,
    required String amount,
    String? terminalId,
    String? terminalSessionId,
  }) async {
    final dbInfo = _avibusDbInfo.firstWhere((e) => e.dbName == dbName);

    final response = await http.post(
      Uri.parse(dbInfo.url),
      headers: dbInfo.header,
      body: XmlRequests.returnOneCPayment(
        returnOrderId: returnOrderId,
        paymentType: paymentType,
        amount: amount,
      ),
    );

    try {
      return _updateReturnOneCPaymentSubject(response, dbName);
    } catch (e) {
      CoreLogger.errorLog(
        'Caught exception',
        params: {'Exception': e},
      );

      return 'error';
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
    _singleTripSubject.add((null, false));
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
  void clearOneCPayment() {
    _oneCPaymentSubject.add(null);
  }

  @override
  void clearAddTicketReturn() {
    _addTicketReturnSubject.add(null);
  }

  @override
  void clearReturnOneCPayment() {
    _returnOneCPaymentSubject.add(null);
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

      final busStops = jsonData
          .map(
            (stops) => BusStopMapper().fromJson(stops),
          )
          .toList();
      CoreLogger.infoLog(
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
        CoreLogger.infoLog(
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
    if (_tripsSubjectsList == null) return;

    if (response.statusCode == 200) {
      final jsonData = XmlConverter.xml2JsonConvert(
        response: response.body,
        xmlRequestName: XmlRequestName.getTrips,
      );

      final trips =
          jsonData.map((trips) => TripMapper().fromJson(trips)).toList();

      CoreLogger.infoLog(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );

      _tripsSubjectsList![subjectIndex].add(trips);
    } else {
      CoreLogger.infoLog(
        'Bad elements',
        params: {'$dbName response ': response.statusCode},
      );

      _tripsSubjectsList![subjectIndex].add([]);
    }

    if (!_tripsSubjectsList!.map((e) => e.value).toList().contains(null)) {
      final combinedTrips =
          _tripsSubjectsList!.map((subject) => subject.value!).toList();

      _tripsSubject.add(combinedTrips.expand((trips) => trips).toList());
    }
  }

  Future<bool> _updateSingleTripSubject(
    http.Response response,
    String dbName,
    int currentDbIndex,
  ) async {
    if (response.statusCode == 200) {
      _lastFoundedDbName = dbName;

      final jsonData = XmlConverter.packageXmlConverter(xml: response.body);
      final jsonPath = jsonData['soap:Envelope']['soap:Body']
          ['m:GetTripSegmentResponse']['m:return'];

      final singleTrip = SingleTripMapper().fromJson(jsonPath);
      CoreLogger.infoLog(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );

      _singleTripSubject.add(
        (singleTrip, currentDbIndex == _avibusDbInfo.length - 1),
      );

      return true;
    } else {
      CoreLogger.infoLog(
        'Bad elements',
        params: {'$dbName response ': response.statusCode},
      );

      _singleTripSubject.add(
        (null, currentDbIndex == _avibusDbInfo.length - 1),
      );

      return false;
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

      CoreLogger.infoLog(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );
      _saleSessionSubject.add(saleSession);
    } else {
      try {
        final innerXmlText = XmlConverter.parsedXml(response.body).innerText;

        const descOpenTag = '<errordescription>';
        // ignore: unnecessary_string_escapes
        const descCloseTag = '<\/errordescription>';

        final errorDescription = innerXmlText.substring(
          innerXmlText.indexOf(descOpenTag) + descOpenTag.length,
          innerXmlText.indexOf(descCloseTag),
        );

        if (!errorDescription.contains('Заказ не найден')) {
          _saleSessionSubject.add(
            StartSaleSession.error(errorDescription),
          );
        }
      } catch (e) {
        CoreLogger.infoLog(
          'Bad elements',
          params: {'$dbName response ': response.body},
        );
        if (!_saleSessionSubjectHasValue) {
          _saleSessionSubject.add(
            StartSaleSession.error('Неизвестная ошибка'),
          );
        }
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

        CoreLogger.infoLog(
          'Good status',
          params: {'$dbName response ': response.statusCode},
        );
        _occupiedSeatSubject.add(occupiedSeat);
      }
    } else {
      CoreLogger.infoLog(
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
      CoreLogger.infoLog(
        'ORDER ID: ${tickets.number} TICKET ID: ${tickets.tickets[0].number}',
      );
      CoreLogger.infoLog(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );

      // ignore: unused_local_variable
      final data = tickets.tickets.first.personalData?.first;

      _addTicketSubject.add(tickets);
    } else {
      final innerXmlText = XmlConverter.parsedXml(response.body).innerText;

      try {
        CoreLogger.infoLog(
          'Bad elements',
          params: {'$dbName response ': response.statusCode},
        );

        const descOpenTag = '<errordescription>';
        // ignore: unnecessary_string_escapes
        const descCloseTag = '<\/errordescription>';

        final errorDescription = innerXmlText.substring(
          innerXmlText.indexOf(descOpenTag) + descOpenTag.length,
          innerXmlText.indexOf(descCloseTag),
        );

        if (!errorDescription.contains('Заказ не найден')) {
          _addTicketSubject.add(
            AddTicket.error(
              number: errorDescription,
            ),
          );
        }
      } catch (e) {
        CoreLogger.infoLog(
          'Bad elements',
          params: {'$dbName response ': response.statusCode},
        );

        if (!_addTicketSubjectHasValue) {
          _addTicketSubject.add(
            const AddTicket.error(
              number: 'Неизвестная ошибка, повторите попытку!',
            ),
          );
        }
      }
    }
  }

  Future<String> _updateSetTicketDataSubject(
    http.Response response,
    String dbName,
  ) async {
    if (response.statusCode == 200) {
      final jsonData = XmlConverter.packageXmlConverter(xml: response.body);

      final jsonPath = jsonData['soap:Envelope']['soap:Body']
          ['m:SetTicketDataResponse']['m:return'];
      final ticketData = SetTicketDataMapper().fromJson(jsonPath);

      CoreLogger.infoLog(
        'Data Set',
        params: {'$dbName response ': response, 'json': jsonPath},
      );
      _setTicketDataSubject.add(ticketData);

      return dbName;
    } else {
      final innerXmlText = XmlConverter.parsedXml(response.body).innerText;

      try {
        CoreLogger.infoLog(
          'Bad elements',
          params: {'$dbName response ': response.statusCode},
        );

        const descOpenTag = '<errordescription>';
        // ignore: unnecessary_string_escapes
        const descCloseTag = '<\/errordescription>';

        final errorDescription = innerXmlText.substring(
          innerXmlText.indexOf(descOpenTag) + descOpenTag.length,
          innerXmlText.indexOf(descCloseTag),
        );

        if (!errorDescription.contains('Заказ не найден')) {
          _setTicketDataSubject.add(
            SetTicketData.error(
              number: errorDescription,
            ),
          );
        }
      } catch (e) {
        CoreLogger.infoLog(
          'Bad elements',
          params: {'$dbName response ': response.statusCode},
        );

        if (!_setTicketDataSubjectHasValue) {
          _setTicketDataSubject.add(
            const SetTicketData.error(
              number: 'Неизвестная ошибка, повторите попытку!',
            ),
          );
        }
      }
    }

    return 'error';
  }

  Future<String> _updateReserveOrderSubject(
    http.Response response,
    String dbName,
  ) async {
    if (response.statusCode == 200) {
      final jsonData = XmlConverter.packageXmlConverter(xml: response.body);

      final jsonPath = jsonData['soap:Envelope']['soap:Body']
          ['m:ReserveOrderResponse']['m:return'];

      final reserveOrder = ReserveOrderMapper().fromJson(jsonPath);

      CoreLogger.infoLog(
        'Ticket reserved',
        params: {'$dbName response ': response.statusCode, 'json': jsonPath},
      );
      _reserveOrderSubject.add(reserveOrder);

      return dbName;
    } else {
      CoreLogger.errorLog(
        'Bad elements',
        params: {'$dbName response ': response.body},
      );
      if (!_reserveOrderSubjectHasValue) {
        _reserveOrderSubject.add(null);
      }

      return 'error';
    }
  }

  Future<String> _updateOneCPaymentSubject(
    http.Response response,
    String dbName,
  ) async {
    if (response.statusCode == 200) {
      CoreLogger.infoLog(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );

      return 'success';
    } else {
      CoreLogger.errorLog(
        'Bad elements',
        params: {'$dbName response ': response.body},
      );

      return 'error';
    }
  }

  Future<String> _updateAddTicketReturnSubject(
    http.Response response,
    String dbName,
  ) async {
    try {
      final jsonData = XmlConverter.packageXmlConverter(xml: response.body);

      CoreLogger.infoLog(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );

      final refundNumber = jsonData['soap:Envelope']['soap:Body']
          ['m:AddTicketReturnResponse']['m:return']['Number'];

      return refundNumber;
    } catch (e) {
      CoreLogger.errorLog(
        'Bad elements',
        params: {'$dbName response ': response.body},
      );

      return 'error';
    }
  }

  Future<String> _updateCancelPaymentSubject(
    http.Response response,
    String dbName,
  ) async {
    try {
      final jsonData = XmlConverter.packageXmlConverter(xml: response.body);

      CoreLogger.infoLog(
        'Good status',
        params: {'$dbName response ': response.statusCode},
      );

      final refundNumber = jsonData['soap:Envelope']['soap:Body']
          ['m:CancelPaymentResponse']['m:return'];

      return refundNumber;
    } catch (e) {
      CoreLogger.errorLog(
        'Bad elements',
        params: {'$dbName response ': response.statusCode},
      );

      return 'error';
    }
  }

  Future<String> _updateReturnOneCPaymentSubject(
    http.Response response,
    String dbName,
  ) async {
    if (response.statusCode == 200) {
      final convertedResponse = XmlConverter.packageXmlConverter(
        xml: response.body,
      );

      final amountForRefund = convertedResponse['soap:Envelope']['soap:Body']
          ['m:ReturnPaymentResponse']['m:return']['Amount'];

      CoreLogger.infoLog(
        'Good status',
        params: {'$dbName response ': 'Amount for refund: $amountForRefund'},
      );

      return amountForRefund;
    } else {
      CoreLogger.errorLog(
        'Bad elements',
        params: {'$dbName response ': response.body},
      );

      return 'error';
    }
  }

  void _initializeTripsSubjectsList() {
    _tripsSubjectsList = List.generate(
      _avibusDbInfo.length,
      (index) => BehaviorSubject.seeded(null),
    );

    _initializationStatusSubject.add(true);
  }

  void _initializeDatabaseInformation() {
    _avibusDbInfo = _avibusSettings
        .where((e) => e.enabled)
        .map(
          (e) => DbInfo(
            url: e.apiUrl,
            header: PrivateInfo.avibisHeaders(
              avibusLogin: e.apiLogin,
              avibusPassword: e.apiPassword,
            ),
            dbName: e.dbName,
          ),
        )
        .toList();
  }

  void _clearTripsSubjects() {
    if (_tripsSubjectsList == null) return;

    for (final subject in _tripsSubjectsList!) {
      subject.add(null);
    }
  }
}
