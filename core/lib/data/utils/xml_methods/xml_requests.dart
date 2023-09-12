// ignore_for_file: lines_longer_than_80_chars
import 'package:core/avtovas_core.dart';

abstract final class XmlRequests {
  /// getBusStops( ) - Get all available bus stops, doesn't require any parameters
  static String getBusStops() {
    return '''
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport">
      <soap:Header/>
        <soap:Body>
          <sal:GetBusStops/>
        </soap:Body>
    </soap:Envelope>
  ''';
  }

  /// getDestinations - Get destinations for a selected stop.
  ///
  /// [departure] - Name or ID of the departure bus station, which can be obtained from getBusStops( ).
  static String getDestinations({
    required String departure,
  }) {
    return '''
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport">
      <soap:Header/>
        <soap:Body>
          <sal:GetDestinations>
            <sal:Substring></sal:Substring>
            <sal:Departure>$departure</sal:Departure>
          </sal:GetDestinations>
        </soap:Body>
    </soap:Envelope>
  ''';
  }

  /// getTrips( ) - Get all trips by the specified [departure], [destination], and [tripsDate].
  ///
  /// [departure] - Name or ID of the departure bus station, which can be obtained from getBusStops( ).
  ///
  /// [destination] - Name or ID of the destination bus station, which can be obtained from getBusStops( ).
  ///
  /// [tripsDate] - The date parameter must be in the {YYYY-MM-DD} format.
  static String getTrips({
    required String departure,
    required String destination,
    required String tripsDate,
  }) {
    return '''
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport">
      <soap:Header/>
        <soap:Body>
          <sal:GetTrips>
            <sal:Departure>$departure</sal:Departure>
            <sal:Destination>$destination</sal:Destination>
            <sal:TripsDate>$tripsDate</sal:TripsDate>
          </sal:GetTrips>
        </soap:Body>
    </soap:Envelope>
  ''';
  }

  /// getTrip( ) - Get a specific trip by providing the [tripId] and [busStop].
  ///
  /// [tripId] - The ID of the specific trip, which can be obtained from getTrips( ).
  ///
  /// [busStop] - The name or ID of the departure bus station, which can be obtained from getTrips( ).
  static String getTrip({
    required String tripId,
    required String busStop,
  }) {
    return '''
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport">
      <soap:Header/>
        <soap:Body>
          <sal:GetTrip>
            <sal:TripId>$tripId</sal:TripId>
            <sal:BusStop>$busStop</sal:BusStop>
          </sal:GetTrip>
        </soap:Body>
    </soap:Envelope>''';
  }

  /// getOccupiedSeats( ) - Get list of all occupied seats and their status.
  ///
  /// [tripId] - The ID of the specific trip, which can be obtained from [getTrips( ) , getTrip( )].
  ///
  /// [departure] - Name or ID of the departure bus station, which can be obtained from [getTrips( ) , getTrip( ) , getBusStops( )].
  ///
  /// [destination] - Name or ID of the destination bus station, which can be obtained from [getTrips( ) , getTrip( ) , getBusStops( )].
  static String getOccupiedSeats({
    required String tripId,
    required String departure,
    required String destination,
  }) {
    return '''
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport">
      <soap:Header/>
        <soap:Body>
          <sal:GetOccupiedSeats>
            <sal:TripId>$tripId</sal:TripId>
            <sal:Departure>$departure</sal:Departure>
            <sal:Destination>$destination</sal:Destination>
            <sal:OrderId></sal:OrderId>
          </sal:GetOccupiedSeats>
        </soap:Body>
      </soap:Envelope>
  ''';
  }

  /// startSaleSession( ) - Method that opens a sales session and gives a number for further methods.
  ///
  /// [tripId] - The ID of the specific trip, which can be obtained from [getTrips( ) , getTrip( )].
  ///
  /// [departure] - Name or ID of the departure bus station, which can be obtained from [getTrips( ) , getTrip( ) , getBusStops( )].
  ///
  /// [destination] - Name or ID of the destination bus station, which can be obtained from [getTrips( ) , getTrip( ) , getBusStops( )].
  static String startSaleSession({
    required String tripId,
    required String departure,
    required String destination,
  }) {
    return '''
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport">
      <soap:Header/>
        <soap:Body>
          <sal:StartSaleSession>
            <sal:TripId>$tripId</sal:TripId>
            <sal:Departure>$departure</sal:Departure>
            <sal:Destination>$destination</sal:Destination>
            <sal:OrderId></sal:OrderId>
          </sal:StartSaleSession>
        </soap:Body>
      </soap:Envelope>
  ''';
  }

  /// addTicket( ) - Method for adding a ticket to the order, for further reservation and payment.
  ///
  /// [orderId] - The ID of the order of specific trip , can be obtained from startSaleSession( ).
  ///
  /// [auxiliaryAddTicket] - Is including , the name of the ticket fare, for example, 'Passenger', 
  /// 'Child' and Seat Number.
  static String addTicket({
    required List<AuxiliaryAddTicket> auxiliaryAddTicket,
    required String orderId,
    String? parentTicketSeatNum,
  }) {
    final elements = auxiliaryAddTicket.asMap().entries.map((entry) {
      final data = entry.value;

      return '''
  <xdto:Elements>
    <xdto:FareName>${data.fares}</xdto:FareName>
    <xdto:SeatNum>${data.seats}</xdto:SeatNum>
  </xdto:Elements>
  ''';
    }).join();

    return '''
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport" xmlns:xdto="http://www.unistation.ru/xdto">
      <soap:Header/>
        <soap:Body>
          <sal:AddTickets>
            <sal:OrderId>$orderId</sal:OrderId>
              <sal:TicketSeats>
                $elements
              </sal:TicketSeats>
            </sal:AddTickets>
          </soap:Body>
        </soap:Envelope>
    ''';
  }

  /// setTicketData - Set ticket data.
  ///
  /// [orderId] - Number,
  /// [personalData] - List of PersonalData,

  static String setTicketData({
    required String orderId,
    required List<PersonalData> personalData,
  }) {
    final elements = personalData.map((data) {
      return '''
    <Elements>
      <Number>${data.ticketNumber}</Number>
      <SeatNum>${data.seatNum}</SeatNum>
      <FareName>${data.fareName}</FareName>
      <PersonalData>
        <Name>ФИО</Name>
        <Value>${data.fullName}</Value>
      </PersonalData>
      <PersonalData>
        <Name>Удостоверение</Name>
        <Value>${data.documentNum}</Value>
        <ValueKind>${data.documentType}</ValueKind>
      </PersonalData>
      <PersonalData>
				<Name>Дата рождения</Name>
				<Value>${data.dateOfBirth}</Value>
			</PersonalData>
			<PersonalData>
				<Name>Пол</Name>
				<Value>${data.gender}</Value>
			</PersonalData>
			<PersonalData>
				<Name>Гражданство</Name>
				<Value>${data.citizenship}</Value>
			</PersonalData>
    </Elements>
    ''';
    }).join();

    return '''
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport" xmlns:xdto="http://www.unistation.ru/xdto">
      <soap:Header/>
        <soap:Body>
          <sal:SetTicketData>
            <sal:OrderId>$orderId</sal:OrderId>
              <Tickets xmlns="http://www.unistation.ru/xdto" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Tickets">
				        $elements
		          </Tickets>
            </sal:SetTicketData>
          </soap:Body>
      </soap:Envelope>
  ''';
  }

  static String reserveOrder({
    required String orderId,
    String? name,
    String? phone,
    String? email,
    String? comment,
  }) {
    return '''
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport" xmlns:xdto="http://www.unistation.ru/xdto">
      <soap:Header/>
        <soap:Body>
          <sal:ReserveOrder>
          <sal:OrderId>$orderId</sal:OrderId>
          <Customer xmlns="http://www.unistation.ru/xdto" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="Customer">
			      <Name>$name</Name>
			      <Phone>$phone</Phone>
			      <Email>$email</Email>
			      <Comment>$comment</Comment>
		      </Customer>
          <ReserveKind></ReserveKind>
          <ChequeSettings xmlns="http://www.unistation.ru/xdto" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="ChequeSettings">
			      <ChequeWidth>48</ChequeWidth>
		      </ChequeSettings>
        </sal:ReserveOrder>
      </soap:Body>
    </soap:Envelope>
  ''';
  }

  /// payment( ) - The final method for making a payment.
  ///
  /// [orderId] - The ID of the order of specific trip , can be obtained from [startSaleSession( ), addTicket( )].
  ///
  /// [paymentType] - Payment type , for example, PaymentCard.
  ///
  /// [amount] - Payment amount for ticket(s).
  static String payment({
    required String orderId,
    required String paymentType,
    required String amount,
    String? terminalId,
    String? terminalSessionId,
  }) {
    return '''
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport" xmlns:xdto="http://www.unistation.ru/xdto">
      <soap:Header/>
        <soap:Body>
          <sal:Payment>
            <sal:OrderId>$orderId</sal:OrderId>
            <sal:TerminalId>$terminalId</sal:TerminalId>
            <sal:TerminalSessionId>$terminalSessionId</sal:TerminalSessionId>
            <sal:PaymentItems>
              <xdto:Elements>
                <xdto:PaymentType>$paymentType</xdto:PaymentType>
                <xdto:Amount>$amount</xdto:Amount>
              </xdto:Elements>
            </sal:PaymentItems>
            <sal:ChequeSettings>
              <xdto:ChequeWidth>48</xdto:ChequeWidth>
            </sal:ChequeSettings>
          </sal:Payment>
        </soap:Body>
    </soap:Envelope>
  ''';
  }

  /// addTicketReturn( ) - Method for adding a ticket to the refund.
  ///
  /// [ticketNumber] - The ID of the ticketNumber of specific trip.
  ///
  /// [seatNum] - Seat number.
  ///
  /// [departure] - Name or ID of the departure bus station.
  static String addTicketReturn({
    required String ticketNumber,
    required String seatNum,
    required String departure,
  }) {
    return '''
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport">
      <soap:Header/>
        <soap:Body>
          <sal:AddTicketReturn>
            <sal:TicketNumber>$ticketNumber</sal:TicketNumber>
            <sal:SeatNum>$seatNum</sal:SeatNum>
            <sal:Departure>$departure</sal:Departure>
            <sal:ReturnOrderId></sal:ReturnOrderId>
          </sal:AddTicketReturn>
        </soap:Body>
    </soap:Envelope>
  ''';
  }

  /// returnPayment( ) - The final method for refund.
  ///
  /// [returnOrderId] - The ID of the returnOrder of ticket , can be obtained from addTicketReturn( ).
  ///
  /// [paymentType] - Payment type , for example, PaymentCard.
  ///
  /// [amount] - Payment amount for ticket(s).
  static String returnPayment({
    required String returnOrderId,
    required String paymentType,
    required String amount,
    String? terminalId,
    String? terminalSessionId,
  }) {
    return '''
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport" xmlns:xdto="http://www.unistation.ru/xdto">
      <soap:Header/>
        <soap:Body>
          <sal:ReturnPayment>
            <sal:ReturnOrderId>$returnOrderId</sal:ReturnOrderId>
            <sal:TerminalId>$terminalId</sal:TerminalId>
            <sal:TerminalSessionId>$terminalSessionId</sal:TerminalSessionId>
            <sal:PaymentItems>
              <xdto:Elements>
                <xdto:PaymentType>$paymentType</xdto:PaymentType>
                <xdto:Amount>$amount</xdto:Amount>
              </xdto:Elements>
            </sal:PaymentItems>
            <sal:ChequeSettings>
              <xdto:ChequeWidth>48</xdto:ChequeWidth>
            </sal:ChequeSettings>
          </sal:ReturnPayment>
        </soap:Body>
      </soap:Envelope>
    ''';
  }
  
}
