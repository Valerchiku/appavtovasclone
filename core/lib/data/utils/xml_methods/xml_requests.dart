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

  /// setTicketsData - Set tickets data.
  ///
  /// [orderId] - ?,
  /// [tickets] - ?,

  static String setTicketsData({
    required String orderId,
    required List<SetTicketDataTicket> tickets,
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
                ${
                  tickets.map((item) => '''
                    <xdto:Number>${item.number}</xdto:Number>
                    ${
                    item.date ?
                      '''
                      <!--Optional:-->
                      <xdto:Date>${item.date}</xdto:Date>
                      '''
                    :
                      ''
                    }
                    ${
                    item.tripId ?
                      '''
                      <!--Optional:-->
                      <xdto:TripId>${item.tripId}</xdto:TripId>
                      '''
                    :
                      ''
                    }
                    ${
                    item.carrier ?
                      '''
                      <!--Optional:-->
                      <xdto:Carrier>${item.carrier}</xdto:Carrier>
                      '''
                    :
                      ''
                    }
                    ${
                    item.parentTicketSeatNum ?
                      '''
                      <!--Optional:-->
                      <xdto:ParentTicketSeatNum>${item.parentTicketSeatNum}</xdto:ParentTicketSeatNum>
                      '''
                    :
                      ''
                    }
                    ${
                    item.seatType ?
                      '''
                      <!--Optional:-->
                      <xdto:SeatType>${item..seatType}</xdto:SeatType>
                      '''
                    :
                      ''
                    }
                    ${
                    item.seatNum ?
                      '''
                      <!--Optional:-->
                      <xdto:SeatNum>${item.seatNum}</xdto:SeatNum>
                      '''
                    :
                      ''
                    }
                    ${
                    item.fareName ?
                      '''
                      <!--Optional:-->
                      <xdto:FareName>${item.fareName}</xdto:FareName>
                      '''
                    :
                      ''
                    }
                    ${
                    item.privilageName ?
                      '''
                      <!--Optional:-->
                      <xdto:PrivilageName>${item.privilageName}</xdto:PrivilageName>
                      '''
                    :
                      ''
                    }
                    ${
                    item.calculation ?
                      '''
                      <!--Optional:-->
                      <xdto:Calculation>
                          ${
                          item.calculation.fareDiscount ?
                            '''
                            <!--Optional:-->
                            <xdto:FareDiscount>${item.calculation.fareDiscount}</xdto:FareDiscount>
                            '''
                          :
                            ''
                          }
                          <xdto:FareAmount>${item.calculation.fareAmount}</xdto:FareAmount>
                          <!--Zero or more repetitions:-->
                          <xdto:Fees>
                            ${
                              item.calculation.fees.map((item) => '''
                                <xdto:Name>${item.name}</xdto:Name>
                                <xdto:Discount>${item.discount}</xdto:Discount>
                                <xdto:Amount>${item.amount}</xdto:Amount>
                                <xdto:CarriersFee>${item.carriersFee}</xdto:CarriersFee> 
                              ''')
                            }
                          </xdto:Fees>
                          <!--Optional:-->
                          <xdto:TotalDiscount>${item.calculation.totalDiscount}</xdto:TotalDiscount>
                          <xdto:TotalAmount>${item.calculation.totalAmount}</xdto:TotalAmount>
                      </xdto:Calculation>
                      '''
                    :
                      ''
                    }
                    ${
                    item.departure ?
                      '''
                      <!--Optional:-->
                      <xdto:Departure>
                          <!--Optional:-->
                          <xdto:Name>${item.departure.name}</xdto:Name>
                          <!--Optional:-->
                          <xdto:Code>${item.departure.code}</xdto:Code>
                          <!--Optional:-->
                          <xdto:Id>${item.departure.id}</xdto:Id>
                          <!--Optional:-->
                          <xdto:Country>${item.departure.country}</xdto:Country>
                          <!--Optional:-->
                          <xdto:Region>${item.departure.region}</xdto:Region>
                          <!--Optional:-->
                          <xdto:District>${item.departure.district}</xdto:District>
                          <!--Optional:-->
                          <xdto:Automated>${item.departure.automated}</xdto:Automated>
                          <!--Optional:-->
                          <xdto:HasDestinations>${item.departure.hasDestinations}</xdto:HasDestinations>
                          <!--Optional:-->
                          <xdto:UTC>${item.departure.utc}</xdto:UTC>
                          <!--Optional:-->
                          <xdto:GPSCoordinates>${item.departure.gpsCoordinates}</xdto:GPSCoordinates>
                          <!--Optional:-->
                          <xdto:LocationType>${item.departure.locationType}</xdto:LocationType>
                          <!--Optional:-->
                          <xdto:Locality>${item.departure.locality}</xdto:Locality>
                          <!--Optional:-->
                          <xdto:StoppingPlace>${item.departure.stoppingPlace}</xdto:StoppingPlace>
                          <!--Optional:-->
                          <xdto:Address>${item.departure.address}</xdto:Address>
                          <!--Optional:-->
                          <xdto:Phone>${item.departure.phone}</xdto:Phone>
                      </xdto:Departure>
                      '''
                    :
                      ''
                    }
                    ${
                    item.departureTime ?
                      '''
                      <!--Optional:-->
                      <xdto:DepartureTime>${item.departureTime}</xdto:DepartureTime>
                      '''
                    :
                      ''
                    }
                    ${
                    item.destination ?
                      '''
                      <!--Optional:-->
                      <xdto:Destination>
                          ${
                          item.destination.name ?
                            '''
                            <!--Optional:-->
                            <xdto:Name>${item.destination.name}</xdto:Name>
                            '''
                          :
                            ''
                          }
                          ${
                          item.destination.code ?
                            '''
                            <!--Optional:-->
                            <xdto:Code>${item.destination.code}</xdto:Code>
                            '''
                          :
                            ''
                          }
                          ${
                          item.destination.id ?
                            '''
                            <!--Optional:-->
                            <xdto:Id>${item.destination.id}</xdto:Id>
                            '''
                          :
                            ''
                          }
                          ${
                          item.destination.country ?
                            '''
                            <!--Optional:-->
                            <xdto:Country>${item.destination.country}</xdto:Country>
                            '''
                          :
                            ''
                          }
                          ${
                          item.destination.region ?
                            '''
                            <!--Optional:-->
                            <xdto:Region>${item.destination.region}</xdto:Region>
                            '''
                          :
                            ''
                          }
                          ${
                          item.destination.district ?
                            '''
                            <!--Optional:-->
                            <xdto:District>${item.destination.district}</xdto:District>
                            '''
                          :
                            ''
                          }
                          ${
                          item.destination.automated ?
                            '''
                            <!--Optional:-->
                            <xdto:Automated>${item.destination.automated}</xdto:Automated>
                            '''
                          :
                            ''
                          }
                          ${
                          item.destination.hasDestinations ?
                            '''
                            <!--Optional:-->
                            <xdto:HasDestinations>${item.destination.hasDestinations}</xdto:HasDestinations>
                            '''
                          :
                            ''
                          }
                          ${
                          item.destination.utc ?
                            '''
                            <!--Optional:-->
                            <xdto:UTC>${item.destination.utc}</xdto:UTC>
                            '''
                          :
                            ''
                          }
                          ${
                          item.destination.gpsCoordinates ?
                            '''
                            <!--Optional:-->
                            <xdto:GPSCoordinates>${item.destination.gpsCoordinates}</xdto:GPSCoordinates>
                            '''
                          :
                            ''
                          }
                          ${
                          item.destination.locationType ?
                            '''
                            <!--Optional:-->
                            <xdto:LocationType>${item.destination.locationType}</xdto:LocationType>
                            '''
                          :
                            ''
                          }
                          ${
                          item.destination.locality ?
                            '''
                            <!--Optional:-->
                            <xdto:Locality>${item.destination.locality}</xdto:Locality>
                            '''
                          :
                            ''
                          }
                          ${
                          item.destination.stoppingPlace ?
                            '''
                            <!--Optional:-->
                            <xdto:StoppingPlace>${item.destination.stoppingPlace}</xdto:StoppingPlace>
                            '''
                          :
                            ''
                          }
                          ${
                          item.destination.address ?
                            '''
                            <!--Optional:-->
                            <xdto:Address>${item.destination.address}</xdto:Address>
                            '''
                          :
                            ''
                          }
                          ${
                          item.destination.phone ?
                            '''
                            <!--Optional:-->
                            <xdto:Phone>${item.destination.phone}</xdto:Phone>
                            '''
                          :
                            ''
                          }
                      </xdto:Destination> 
                      '''
                    :
                      ''
                    }
                    ${
                    item.arrivalTime ?
                      '''
                      <!--Optional:-->
                      <xdto:ArrivalTime>${item.arrivalTime}</xdto:ArrivalTime>
                      '''
                    :
                      ''
                    }
                    ${
                    item.distance ?
                      '''
                      <!--Optional:-->
                      <xdto:Distance>${item.distance}</xdto:Distance>
                      '''
                    :
                      ''
                    }
                    ${
                    item.passengerName ?
                      '''
                      <!--Optional:-->
                      <xdto:PassengerName>${item.passengerName}</xdto:PassengerName>
                      '''
                    :
                      ''
                    }
                    ${
                    item.passengerDoc ?
                      '''
                      <!--Optional:-->
                      <xdto:PassengerDoc>${item.passengerDoc}</xdto:PassengerDoc>
                      '''
                    :
                      ''
                    }
                    <!--Zero or more repetitions:-->
                    <xdto:PersonalData>
                    ${
                      item.personalData.map((item) => '''
                        <xdto:Name>${item.name}</xdto:Name>
                        ${
                        item.caption ?
                          '''
                          <!--Optional:-->
                          <xdto:Caption>${item.caption}</xdto:Caption>
                          '''
                        :
                          ''
                        }
                        ${
                        item.mandatory ?
                          '''
                          <!--Optional:-->
                          <xdto:Mandatory>${item.mandatory}</xdto:Mandatory>
                          '''
                        :
                          ''
                        }
                        ${
                        item.personIdentifier ?
                          '''
                          <!--Optional:-->
                          <xdto:PersonIdentifier>${item.personIdentifier}</xdto:PersonIdentifier>
                            '''
                          :
                            ''
                        }
                        ${
                        item.type ?
                          '''
                          <!--Optional:-->
                          <xdto:Type>${item.type}</xdto:Type>
                            '''
                          :
                            ''
                        }
                        <!--Zero or more repetitions:-->
                        <xdto:ValueVariants>
                        ${
                        item.valueVariants.map((item) => '''
                          <xdto:Name>${item.name}</xdto:Name>
                          ${
                          item.inputMask ?
                            '''
                            <!--Optional:-->
                            <xdto:InputMask>${item.inputMask}</xdto:InputMask>
                            '''
                          :
                            ''
                          }
                          ${
                          item.valueProperty1 ?
                            '''
                            <!--Optional:-->
                            <xdto:ValueProperty1>${item.valueProperty1}</xdto:ValueProperty1>
                            '''
                          :
                            ''
                          }
                          ${
                          item.valueProperty2 ?
                            '''
                            <!--Optional:-->
                            <xdto:ValueProperty2>${item.valueProperty2}</xdto:ValueProperty2>
                            '''
                          :
                            ''
                          }
                          ${
                          item.valueProperty3 ?
                            '''
                            <!--Optional:-->
                            <xdto:ValueProperty3>${item.valueProperty3}</xdto:ValueProperty3>
                            '''
                          :
                            ''
                          }
                          ${
                          item.valueProperty4 ?
                            '''
                            <!--Optional:-->
                            <xdto:ValueProperty4>${item.valueProperty4}</xdto:ValueProperty4>
                            '''
                          :
                            ''
                          }
                          ${
                          item.valueProperty5 ?
                            '''
                            <!--Optional:-->
                            <xdto:ValueProperty5>${item.valueProperty5}</xdto:ValueProperty5>
                            '''
                          :
                            ''
                          }
                        '''
                        }
                        </xdto:ValueVariants>
                        ${
                        item.inputMask ?
                          '''
                          <!--Optional:-->
                          <xdto:InputMask>${inputMask.inputMask}</xdto:InputMask>
                          '''
                        :
                          ''
                        }
                        ${
                        item.value ?
                          '''
                          <!--Optional:-->
                          <xdto:Value>${item.value}</xdto:Value>
                          '''
                        :
                          ''
                        }
                        ${
                        item.valueKind ?
                          '''
                          <!--Optional:-->
                          <xdto:ValueKind>${item.valueKind}</xdto:ValueKind>
                          '''
                        :
                          ''
                        }
                        ${
                        item.defaultValueVariant ?
                          '''
                          <!--Optional:-->
                          <xdto:DefaultValueVariant>
                            <xdto:Name>${item.defaultValueVariant.name}</xdto:Name>
                            ${
                            item.defaultValueVariant.inputMask ?
                              '''
                              <!--Optional:-->
                              <xdto:InputMask>${item.defaultValueVariant.inputMask}</xdto:InputMask>
                              '''
                            :
                              ''
                            }
                            ${
                            item.defaultValueVariant.valueProperty1 ?
                              '''
                              <!--Optional:-->
                              <xdto:ValueProperty1>${item.defaultValueVariant.valueProperty1}</xdto:ValueProperty1>
                            
                              '''
                            :
                              ''
                            }
                            ${
                            item.defaultValueVariant.valueProperty2 ?
                              '''
                              <!--Optional:-->
                              <xdto:ValueProperty2>${item.defaultValueVariant.valueProperty2}</xdto:ValueProperty2>
                              '''
                            :
                              ''
                            }
                            ${
                            item.defaultValueVariant.valueProperty3 ?
                              '''
                              <!--Optional:-->
                              <xdto:ValueProperty3>${item.defaultValueVariant.valueProperty3}</xdto:ValueProperty3>
                              '''
                            :
                              ''
                            }
                            ${
                            item.defaultValueVariant.valueProperty4 ?
                              '''
                              <!--Optional:-->
                              <xdto:ValueProperty4>${item.defaultValueVariant.valueProperty4}</xdto:ValueProperty4>
                              '''
                            :
                              ''
                            }
                            ${
                            item.defaultValueVariant.valueProperty5 ?
                              '''
                              <!--Optional:-->
                              <xdto:ValueProperty5>${item.defaultValueVariant.valueProperty5}</xdto:ValueProperty5>
                              '''
                            :
                              ''
                            }
                          </xdto:DefaultValueVariant>
                          '''
                        :
                          ''
                        }
                        ${
                        item.documentIssueDateRequired ?
                          '''
                          <!--Optional:-->
                          <xdto:DocumentIssueDateRequired>${item.documentIssueDateRequired}</xdto:DocumentIssueDateRequired>
                          '''
                        :
                          ''
                        }
                        ${
                        item.documentIssueOrRequired ?
                          '''
                          <!--Optional:-->
                          <xdto:DocumentIssueOrgRequired>${item.documentIssueOrRequired}</xdto:DocumentIssueOrgRequired>
                          '''
                        :
                          ''
                        }
                        ${
                        item.documentValidityDateRequired ?
                          '''
                          <!--Optional:-->
                          <xdto:DocumentValidityDateRequired>${item.documentValidityDateRequired}</xdto:DocumentValidityDateRequired>
                          '''
                        :
                          ''
                        }
                        ${
                        item.documentInceptionDateRequired ?
                          '''
                          <!--Optional:-->
                          <xdto:DocumentInceptionDateRequired>${item.documentInceptionDateRequired}</xdto:DocumentInceptionDateRequired>
                          '''
                        :
                          ''
                        }
                        ${
                        item.documentIssuePlaceRequired ?
                          '''
                          <!--Optional:-->
                          <xdto:DocumentIssuePlaceRequired>${item.documentIssuePlaceRequired}</xdto:DocumentIssuePlaceRequired>
                          '''
                        :
                          ''
                        }
                        ${
                        item.value1 ?
                          '''
                          <!--Optional:-->
                          <xdto:Value1>${item.value1}</xdto:Value1>
                          '''
                        :
                          ''
                        }
                        ${
                        item.value2 ?
                          '''
                          <!--Optional:-->
                          <xdto:InputMask>${item.value2}</xdto:InputMask>
                          '''
                        :
                          ''
                        }
                        <!--Optional:-->
                        <xdto:Value2>?</xdto:Value2>
                        ${
                        item.value3 ?
                          '''
                          <!--Optional:-->
                          <xdto:Value3>${item.value3}</xdto:Value3>
                          '''
                        :
                          ''
                        }
                        ${
                        item.value4 ?
                          '''
                          <!--Optional:-->
                          <xdto:Value4>${item.value4}</xdto:Value4>
                          '''
                        :
                          ''
                        }
                        ${
                        item.value5 ?
                          '''
                          <!--Optional:-->
                          <xdto:Value5>${item.value5}</xdto:Value5>
                          '''
                        :
                          ''
                        }
                        ${
                        item.group ?
                          '''
                          <!--Optional:-->
                          <xdto:Group>${item.group}</xdto:Group>
                          '''
                        :
                          ''
                        }
                        ${
                        item.readonly ?
                          '''
                          <!--Optional:-->
                          <xdto:ReadOnly>${item.readonly}</xdto:ReadOnly>
                          '''
                        :
                          ''
                        }
                      ''')
                    }
                    </xdto:PersonalData>
                    <!--Zero or more repetitions:-->
                    <xdto:AdditionalAttributes>
                        ${
                        item.addtionalAttributes.map((item) => '''
                          <xdto:Name>${item.name}</xdto:Name>
                          ${
                          item.caption ?
                            '''
                            <!--Optional:-->
                            <xdto:Caption>${item.caption}</xdto:Caption>
                            '''
                          :
                            ''
                          }
                          ${
                          item.mandatory ?
                            '''
                            <!--Optional:-->
                            <xdto:Mandatory>${item.mandatory}</xdto:Mandatory>
                            '''
                          :
                            ''
                          }
                          ${
                          item.type ?
                            '''
                            <!--Optional:-->
                            <xdto:Type>${item.type}</xdto:Type>
                            '''
                          :
                            ''
                          }
                          <!--Zero or more repetitions:-->
                          <xdto:ValueVariants>
                          ${
                            item.valueVariants.map((item) => '''
                              <xdto:Name>${item.name}</xdto:Name>
                              ${
                              item.inputMask ?
                                '''
                                <!--Optional:-->
                                <xdto:InputMask>${item.inputMask}</xdto:InputMask>
                                '''
                              :
                                ''
                              }
                              ${
                              item.valueProperty1 ?
                                '''
                                <!--Optional:-->
                                <xdto:ValueProperty1>${item.valueProperty1}</xdto:ValueProperty1>
                                '''
                              :
                                ''
                              }
                              ${
                              item.valueProperty2 ?
                                '''
                                <!--Optional:-->
                                <xdto:ValueProperty2>${item.valueProperty2}</xdto:ValueProperty2>
                                '''
                              :
                                ''
                              }
                              ${
                              item.valueProperty3 ?
                                '''
                                <!--Optional:-->
                                <xdto:ValueProperty3>${item.valueProperty3}</xdto:ValueProperty3>
                                '''
                              :
                                ''
                              }
                              ${
                              item.valueProperty4 ?
                                '''
                                <!--Optional:-->
                                <xdto:ValueProperty4>${item.valueProperty4}</xdto:ValueProperty4>
                                '''
                              :
                                ''
                              }
                              ${
                              item.valueProperty5 ?
                                '''
                                <!--Optional:-->
                                <xdto:ValueProperty5>${item.valueProperty5}</xdto:ValueProperty5> 
                                '''
                              :
                                ''
                              }
                            ''')
                          }
                          </xdto:ValueVariants>
                          ${
                          item.inputMask ?
                            '''
                            <!--Optional:-->
                            <xdto:InputMask>${item.inputMask}</xdto:InputMask>
                            '''
                          :
                            ''
                          }
                          ${
                          item.value ?
                            '''
                            <!--Optional:-->
                            <xdto:Value>${item.value}</xdto:Value>
                            '''
                          :
                            ''
                          }
                          ${
                          item.costAttribute ?
                            '''
                            <!--Optional:-->
                            <xdto:CostAttribute>${item.costAttribute}</xdto:CostAttribute>
                            '''
                          :
                            ''
                          }
                          ${
                          item.group ?
                            '''
                            <!--Optional:-->
                            <xdto:Group>${item.group}</xdto:Group>
                            '''
                          :
                            ''
                          }
                          '''
                        }
                    </xdto:AdditionalAttributes>
                    <!--Zero or more repetitions:-->
                    <xdto:Cheques>
                    ${
                      item.cheques.map((item) => '''
                        <!--Zero or more repetitions:-->
                        <xdto:ChequeLines>
                        ${
                        items.map((item) => '''
                          $item
                        '''
                        }
                        </xdto:ChequeLines>
                        ${
                        item.barcode ?
                          '''
                          <!--Optional:-->
                          <xdto:Barcode>${item.barcode}</xdto:Barcode>
                          '''
                        :
                          ''
                        }
                        <xdto:Fiscal>${item.fiscal}</xdto:Fiscal>
                        <xdto:FiscalSum>${item.fiscalSum}</xdto:FiscalSum>
                        ${
                        item.caption ?
                          '''
                          <!--Optional:-->
                          <xdto:Caption>${item.caption}</xdto:Caption>
                          '''
                        :
                          ''
                        }
                        ${
                        item.sticker ?
                          '''
                          <!--Optional:-->
                          <xdto:Sticker>${item.sticker}</xdto:Sticker>
                          '''
                        :
                          ''
                        }
                        ${
                        item.printed ?
                          '''
                          <!--Optional:-->
                          <xdto:Printed>${item.printed}</xdto:Printed>
                          '''
                        :
                          ''
                        }
                        <!--Zero or more repetitions:-->
                        <xdto:FiscalSection>
                        ${
                        item.fiscalSection.map((item) => '''
                          <xdto:SectionNumber>${item.sectionNumber}</xdto:SectionNumber>
                          <xdto:SectionSum>${item.sectionSum}</xdto:SectionSum>
                          ${
                          item.tax ?
                            '''
                            <!--Optional:-->
                            <xdto:Tax>${item.tax}</xdto:Tax>
                            '''
                          :
                            ''
                          }
                        ''')
                        }
                        </xdto:FiscalSection>
                        ${
                        item.chequeID ?
                          '''
                          <!--Optional:-->
                          <xdto:ChequeID>${item.chequeID}</xdto:ChequeID>
                          '''
                        :
                          ''
                        }
                        ${
                        item.dbDocNum ?
                          '''
                          <!--Optional:-->
                          <xdto:DBDocNum>${item.dbDocNum}</xdto:DBDocNum>
                          '''
                        :
                          ''
                        }
                        ${
                        item.parentDoc ?
                          '''
                          <!--Optional:-->
                          <xdto:ParentDoc>${item.parentDoc}</xdto:ParentDoc>
                          '''
                        :
                          ''
                        }
                        <!--Zero or more repetitions:-->
                        <xdto:Positions>
                          ${
                            item.positions.map((item) => '''
                              <xdto:Name>${item.name}</xdto:Name>
                              <xdto:SumWithDiscount>${item.sumWithDiscount}</xdto:SumWithDiscount>
                              <!--Optional:-->
                              <xdto:Sum54FLWithDiscount>${item.sumWithDiscount}</xdto:Sum54FLWithDiscount>
                              <xdto:FiscalSectionNumber>${item.fiscalSectionNumber}</xdto:FiscalSectionNumber>
                              <!--Optional:-->
                              <xdto:VAT>${item.vat}</xdto:VAT>
                              <!--Optional:-->
                              <xdto:VAT54FL>${item.vat54fl}</xdto:VAT54FL>
                              <!--Optional:-->
                              <xdto:PurveyorData>
                                  <!--Optional:-->
                                  <xdto:Name>${item.name}</xdto:Name>
                                  <!--Optional:-->
                                  <xdto:TaxId>${item.taxId}</xdto:TaxId>
                                  <!--Optional:-->
                                  <xdto:Phone>${item.phone}</xdto:Phone>
                              </xdto:PurveyorData>
                              <!--Optional:-->
                              <xdto:SignCalculationObject>${item.signCalculationObject}</xdto:SignCalculationObject>
                              <!--Optional:-->
                              <xdto:SignMethodCalculation>${item.signMethodCalculation}</xdto:SignMethodCalculation>
                            ''')
                          }
                        </xdto:Positions>
                        ${
                        item.qrCode ?
                          '''
                          <!--Optional:-->
                          <xdto:QRCode>${item.qrCode}</xdto:QRCode>
                          '''
                        :
                          ''
                        }
                      '''
                    }
                    </xdto:Cheques>
                    ${
                    item.absence ?
                      '''
                      <!--Optional:-->
                      <xdto:Absence>${item.absence}</xdto:Absence>
                      '''
                    :
                      ''
                    }                  
                    ${
                    item.faultDistance ?
                      '''
                      <!--Optional:-->
                      <xdto:FaultDistance>${item.faultDistance}</xdto:FaultDistance>
                      '''
                    :
                      ''
                    }
                    ${
                    item.faultCarrier ?
                      '''
                      <!--Optional:-->
                      <xdto:FaultCarrier>${item.faultCarrier}</xdto:FaultCarrier>
                      '''
                    :
                      ''
                    }
                    ${
                    item.customer ?
                      '''
                      <!--Optional:-->
                      <xdto:Customer>
                          ${
                          item.customer.name ?
                            '''
                            <!--Optional:-->
                            <xdto:Name>${item.customer.name}</xdto:Name>
                            '''
                          :
                            ''
                          }
                          ${
                          customer.phone ?
                            '''
                            <!--Optional:-->
                            <xdto:Phone>${item.customer.phone}</xdto:Phone>
                            '''
                          :
                            ''
                          }
                          ${
                          item.customer.email ?
                            '''
                            <!--Optional:-->
                            <xdto:Email>${item.customer.email}</xdto:Email>
                            '''
                          :
                            ''
                          }
                          ${
                          item.customer.comment ?
                            '''
                            <!--Optional:-->
                            <xdto:Comment>${item.customer.comment}</xdto:Comment>
                            '''
                          :
                            ''
                          }
                      </xdto:Customer>
                      '''
                    :
                      ''
                    }
                    ${
                    item.marketingCampaign ?
                      '''
                      <!--Optional:-->
                      <xdto:MarketingCampaign>
                          ${
                          item.marketingCampaign.name ?
                            '''
                            <!--Optional:-->
                            <xdto:Name>${item.marketingCampaign.name}</xdto:Name>
                            '''
                          :
                            ''
                          }
                          ${
                          item.marketingCampaign.id ?
                            '''
                            <!--Optional:-->
                            <xdto:Id>${item.marketingCampaign.id}</xdto:Id>
                            '''
                          :
                            ''
                          }
                      </xdto:MarketingCampaign>
                      '''
                    :
                      ''
                    }
                    ${
                    item.busstationFee ?
                      '''
                      <!--Optional:-->
                      <xdto:BusstationFee>${item.busstationFee}</xdto:BusstationFee>
                      '''
                    :
                      ''
                    }
                    ${
                    item.manualEntryOfTickets ?
                      '''
                      <!--Optional:-->
                      <xdto:ManualEntryOfTickets>${item.manualEntryOfTickets}</xdto:ManualEntryOfTickets>
                      '''
                    :
                      ''
                    } 
                  ''')
                }
                </xdto:Elements>
              </sal:Tickets>
          </sal:SetTicketData>
      </soap:Body>
  </soap:Envelope>
  ''';

  /// addTickets - Add tickets.
  ///
  /// [orderId] - ?,
  /// [fareName] - ?,
  /// [seatNum] - ?.
  /// [destination] - ?.
  /// [ticketNumber] - ?.
  /// [parentTicketSeatNum] - ?.
  static String addTickets({
    required String orderId,
    required List<AddTicketSeat> ticketSeats,
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
                  ${
                    ticketSeats.map((item) => '''
                      <xdto:FareName>${item.fareName}</xdto:FareName>
                      <xdto:SeatNum>${item.seatNum}</xdto:SeatNum>
                      ${
                      item.destination ?
                        '''
                        <!--Optional:-->
                        <xdto:Destination>${item.destination}</xdto:Destination>
                        '''
                      :
                        ''
                      }
                      ${
                      item.ticketNumber ?
                        '''
                        <!--Optional:-->
                        <xdto:TicketNumber>${item.ticketNumber}</xdto:TicketNumber>
                        '''
                      :
                        ''
                      }
                      ${
                      item.parentTicketSeatNum ?
                        '''
                        <!--Optional:-->
                        <xdto:ParentTicketSeatNum>${item.parentTicketSeatNum}</xdto:ParentTicketSeatNum>
                        '''
                      :
                        ''
                      }
                    ''')
                  }
                </xdto:Elements>
            </sal:TicketSeats>
          </sal:AddTickets>
      </soap:Body>
    </soap:Envelope>
  ''';
  }
}
