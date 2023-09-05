import 'package:core/domain/entities/oneC_entities/personal_data.dart';

abstract final class XmlRequests {
  /// getBusStops - Get a list of stops
  static String getBusStops() {
    return '''
<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport">
      <soap:Header/>
        <soap:Body>
          <sal:GetBusStops/>
        </soap:Body>
    </soap:Envelope>''';
  }

  /// getDestinations - Get destinations for a selected stop.
  ///
  /// [departure] - can be taken from getBusStops.
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

  /// getTrips - Receiving trips by destination.
  ///
  /// [departure] - can be taken from getBusStops,
  /// [destination] - can be taken from getBusStops,
  /// [tripsDate] - parameter must be in the YYYY-MM-DD format.
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

  /// getOccupiedSeats - Getting information on occupied seats.
  ///
  /// [tripId] - can be taken from getTrips as Id,
  /// [departure] - can be taken from getTrips,
  /// [destination] - can be taken from getTrips.
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

  static String addTickets({
    required String orderId,
    required String fareName,
    required String seatNum,
    String? parentTicketSeatNum,
  }) {
    return '''
    <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport" xmlns:xdto="http://www.unistation.ru/xdto">
      <soap:Header/>
        <soap:Body>
          <sal:AddTickets>
            <sal:OrderId>$orderId</sal:OrderId>
              <sal:TicketSeats>
                <xdto:Elements>
                  <xdto:FareName>$fareName</xdto:FareName>
                  <xdto:SeatNum>$seatNum</xdto:SeatNum>
                  <!--Optional:-->
                  <xdto:Destination></xdto:Destination>
                  <!--Optional:-->
                  <xdto:TicketNumber></xdto:TicketNumber>
                  <!--Optional:-->
                  <xdto:ParentTicketSeatNum>${parentTicketSeatNum ?? ''}</xdto:ParentTicketSeatNum>
                </xdto:Elements>
              </sal:TicketSeats>
            </sal:AddTickets>
          </soap:Body>
        </soap:Envelope>
    ''';
  }
}
