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
  /// [orderId] - order id,
  /// [number] - number,
  /// [seatNum] - number,
  /// [fareName] - fareName

  static String setTicketData({
    required String orderId,
    required String number,
    required String seatNum,
    required String fareName,
  }) {
    return '''
        <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport" xmlns:xdto="http://www.unistation.ru/xdto">
          <soap:Header/>
            <soap:Body>
              <sal:SetTicketData>
                <sal:OrderId>$orderId</sal:OrderId>
                <sal:Tickets>
                    <!--Zero or more repetitions:-->
                    <xdto:Elements>
                      <xdto:Number>$number</xdto:Number>
                      <xdto:SeatNum>$seatNum</xdto:SeatNum>
                      <xdto:FareName>$fareName</xdto:FareName>
                    </xdto:Elements>
                  </sal:Tickets>
              </sal:SetTicketData>
          </soap:Body>
      </soap:Envelope>
      ''';
  }

  /// addTickets - Add tickets.
  ///
  /// [orderId] - order id,
  /// [fareName] - fare name,
  /// [seatNum] - order id,
  /// [parentTicketSeatNum] - parent ticket seat num,
  static String addTickets({
    required String orderId,
    required String fareName,
    required String seatNum,
    required String parentTicketSeatNum,
  }) {
    return '''
      <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:sal="http://www.unistation.ru/saleport" xmlns:xdto="http://www.unistation.ru/xdto">
        <soap:Header/>
        <soap:Body>
            <sal:AddTickets>
              <sal:OrderId>$orderId</sal:OrderId>
              <sal:TicketSeats>
                  <!--Zero or more repetitions:-->
                  <xdto:Elements>
                    <xdto:FareName>$fareName</xdto:FareName>
                    <xdto:SeatNum>$seatNum</xdto:SeatNum>
                    <xdto:ParentTicketSeatNum>$parentTicketSeatNum</xdto:ParentTicketSeatNum>
                  </xdto:Elements>
              </sal:TicketSeats>
            </sal:AddTickets>
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

  static String addTicket({
    required String orderId,
    required String fareName,
    required String seatNum,
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
                  <xdto:ParentTicketSeatNum></xdto:ParentTicketSeatNum>
                </xdto:Elements>
              </sal:TicketSeats>
            </sal:AddTickets>
          </soap:Body>
        </soap:Envelope>
    ''';
  }
}
