import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/oneC_mappers/carrier_personal_data_mapper.dart';
import 'package:core/data/mappers/oneC_mappers/departure_mapper.dart';
import 'package:core/data/mappers/oneC_mappers/destination_mapper.dart';
import 'package:core/data/mappers/ticket/ticket_additional_attribute_mapper.dart';
import 'package:core/data/mappers/ticket/ticket_calculation_mapper.dart';
import 'package:core/data/mappers/ticket/ticket_cheque_mapper.dart';
import 'package:core/data/mappers/ticket/ticket_customer_mapper.dart';
import 'package:core/data/mappers/ticket/ticket_marketing_campaign_mapper.dart';
import 'package:core/domain/entities/oneC_entities/ticket.dart';

abstract final class _Fields {
  static const String number = 'Number';
  static const String date = 'date';
  static const String tripId = 'tripId';
  static const String carrier = 'Carrier';
  static const String parentTicketSeatNum = 'ParentTicketSeatNum';
  static const String seatType = 'SeatType';
  static const String seatNum = 'SeatNum';
  static const String fareName = 'FareName';
  static const String privilageName = 'PrivilageName';
  static const String calculation = 'Calculation';
  static const String departure = 'Departure';
  static const String departureTime = 'DepartureTime';
  static const String destination = 'Destination';
  static const String arrivalTime = 'ArrivalTime';
  static const String distance = 'Distance';
  static const String passengerName = 'PassengerName';
  static const String passengerDoc = 'PassengerDoc';
  static const String personalData = 'PersonalData';
  static const String addtionalAttributes = 'addtionalAttributes';
  static const String cheques = 'Cheques';
  static const String absence = 'Absence';
  static const String faultDistance = 'FaultDistance';
  static const String faultCarrier = 'FaultCarrier';
  static const String customer = 'Customer';
  static const String marketingCampaign = 'MarketingCampaign';
  static const String manualEntryOfTickets = 'ManualEntryOfTickets';
}

final class TicketMapper implements BaseMapper<Ticket> {
  @override
  Map<String, dynamic> toJson(Ticket data) {
    return {
      _Fields.number: data.number,
      _Fields.date: data.date,
      _Fields.tripId: data.tripId,
      _Fields.carrier: data.carrier,
      _Fields.parentTicketSeatNum: data.parentTicketSeatNum,
      _Fields.seatType: data.seatType,
      _Fields.seatNum: data.seatNum,
      _Fields.fareName: data.fareName,
      _Fields.privilageName: data.fareName,
      _Fields.calculation: TicketCalculationMapper().toJson(data.calculation),
      _Fields.departure: DepartureMapper().toJson(data.departure),
      _Fields.departureTime: data.departureTime,
      _Fields.destination: DestinationMapper().toJson(data.destination),
      _Fields.arrivalTime: data.arrivalTime,
      _Fields.distance: data.distance,
      _Fields.passengerName: data.passengerName,
      _Fields.passengerDoc: data.passengerDoc,
      _Fields.personalData: data.personalData,
      _Fields.addtionalAttributes: data.addtionalAttributes
          .map(TicketAdditionalAttributeMapper().toJson)
          .toList(),
      _Fields.cheques: data.cheques.map(TicketChequeMapper().toJson).toList(),
      _Fields.absence: data.absence,
      _Fields.faultDistance: data.faultDistance,
      _Fields.faultCarrier: data.faultCarrier,
      _Fields.customer: TicketCustomerMapper().toJson(data.customer),
      _Fields.marketingCampaign:
          TicketMarketingCampaignMapper().toJson(data.marketingCampaign),
      _Fields.manualEntryOfTickets: data.manualEntryOfTickets,
    };
  }

  @override
  Ticket fromJson(Map<String, dynamic> json) {
    final addtionalAttributes = json[_Fields.addtionalAttributes];
    return Ticket(
      number: json[_Fields.number],
      date: json[_Fields.date],
      tripId: json[_Fields.tripId],
      carrier: json[_Fields.carrier],
      parentTicketSeatNum: json[_Fields.parentTicketSeatNum],
      seatType: json[_Fields.seatType],
      seatNum: json[_Fields.seatNum],
      fareName: json[_Fields.fareName],
      privilageName: json[_Fields.privilageName],
      calculation: TicketCalculationMapper().fromJson(
        json[_Fields.calculation],
      ),
      departure: DepartureMapper().fromJson(
        json[_Fields.departure],
      ),
      departureTime: _Fields.departureTime,
      destination: DestinationMapper().fromJson(
        json[_Fields.destination],
      ),
      arrivalTime: json[_Fields.arrivalTime],
      distance: json[_Fields.distance],
      passengerName: json[_Fields.passengerName],
      passengerDoc: json[_Fields.passengerDoc],
      personalData:
          CarrierPersonalDataMapper().fromJson(json[_Fields.personalData]),
      addtionalAttributes: addtionalAttributes != null
          ? (addtionalAttributes as List<dynamic>)
              .map((e) => TicketAdditionalAttributeMapper().fromJson(e))
              .toList()
          : List.empty(),
      cheques: json[_Fields.cheques] != null
          ? (_Fields.cheques as List<dynamic>)
              .map((e) => TicketChequeMapper().fromJson(e))
              .toList()
          : List.empty(),
      absence: json[_Fields.absence],
      faultDistance: json[_Fields.faultDistance],
      faultCarrier: json[_Fields.faultCarrier],
      customer: TicketCustomerMapper().fromJson(
        json[_Fields.customer],
      ),
      marketingCampaign: TicketMarketingCampaignMapper().fromJson(
        json[_Fields.marketingCampaign],
      ),
      manualEntryOfTickets: json[_Fields.manualEntryOfTickets],
    );
  }
}
