import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/set_ticket_data/set_ticket_data_ticket_additional_attribute_mapper.dart';
import 'package:core/data/mappers/set_ticket_data/set_ticket_data_ticket_personal_data_mapper.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket.dart';
import 'package:core/data/mappers/set_ticket_data/set_ticket_data_ticket_cheque_mapper.dart';
import 'package:core/data/mappers/set_ticket_data/set_ticket_data_ticket_customer_mapper.dart';
import 'package:core/data/mappers/set_ticket_data/set_ticket_data_ticket_calculation_mapper.dart';
import 'package:core/data/mappers/set_ticket_data/set_ticket_data_ticket_departure_mapper.dart';
import 'package:core/data/mappers/set_ticket_data/set_ticket_data_ticket_marketing_campaign_mapper.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_personal_data.dart';

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
  static const String addtionalAttributes = 'AddtionalAttributes';
  static const String cheques = 'Cheques';
  static const String absence = 'Absence';
  static const String faultDistance = 'FaultDistance';
  static const String faultCarrier = 'FaultCarrier';
  static const String customer = 'Customer';
  static const String marketingCampaign = 'MarketingCampaign';
  static const String busstationFee = 'BusstationFee';
  static const String manualEntryOfTickets = 'ManualEntryOfTickets';
}

final class SetTicketDataTicketMapper implements BaseMapper<SetTicketDataTicket> {
  @override
  Map<String, dynamic> toJson(SetTicketDataTicket data) {
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
      _Fields.calculation: SetTicketDataTicketCalculationMapper().toJson(data.calculation),
      _Fields.departure: SetTicketDataTicketDepartureMapper().toJson(data.departure),
      _Fields.departureTime: data.departureTime,
      _Fields.destination: SetTicketDataTicketDepartureMapper().toJson(data.destination),
      _Fields.arrivalTime: data.arrivalTime,
      _Fields.distance: data.distance,
      _Fields.passengerName: data.passengerName,
      _Fields.passengerDoc: data.passengerDoc,
      _Fields.personalData: data.personalData,
      _Fields.addtionalAttributes: data.addtionalAttributes?.map(SetTicketDataTicketAdditionalAttributeMapper().toJson).toList(),
      _Fields.cheques: data.cheques?.map(SetTicketDataTicketChequeMapper().toJson).toList(),
      _Fields.absence: data.absence,
      _Fields.faultDistance: data.faultDistance,
      _Fields.faultCarrier: data.faultCarrier,
      _Fields.customer: SetTicketDataTicketCustomerMapper().toJson(data.customer),
      _Fields.marketingCampaign: SetTicketDataTicketMarketingCampaignMapper().toJson(data.marketingCampaign),
      _Fields.busstationFee: data.busstationFee,
      _Fields.manualEntryOfTickets: data.manualEntryOfTickets,
    };
  }

  @override
  SetTicketDataTicket fromJson(Map<String, dynamic> json) {
    final addtionalAttributes = json[_Fields.addtionalAttributes];
    return SetTicketDataTicket(
      number: _Fields.number,
      date: _Fields.date,
      tripId: _Fields.tripId,
      carrier: _Fields.carrier,
      parentTicketSeatNum: _Fields.parentTicketSeatNum,
      seatType: _Fields.seatType,
      seatNum: _Fields.seatNum,
      fareName: _Fields.fareName,
      privilageName: _Fields.fareName,
      calculation: SetTicketDataTicketCalculationMapper().fromJson(
        json[_Fields.calculation],
      ),
      departure: SetTicketDataTicketDepartureMapper().fromJson(
        json[_Fields.departure],
      ),
      departureTime: _Fields.departureTime,
      destination: SetTicketDataTicketDepartureMapper().fromJson(
        json[_Fields.destination],
      ),
      arrivalTime: _Fields.arrivalTime,
      distance: _Fields.distance,
      passengerName: _Fields.passengerName,
      passengerDoc: _Fields.passengerDoc,
      personalData: SetTicketDataTicketPersonalDataMapper().fromJson(json[_Fields.personalData]),
      addtionalAttributes: addtionalAttributes != null
          ? (addtionalAttributes as List<dynamic>)
              .map((e) => SetTicketDataTicketAdditionalAttributeMapper().fromJson(e))
              .toList()
          : List.empty(),
      cheques: _Fields.cheques != null
          ? (_Fields.cheques as List<dynamic>)
              .map((e) => SetTicketDataTicketChequeMapper().fromJson(e))
              .toList()
          : List.empty(),
      absence: _Fields.absence,
      faultDistance: _Fields.faultDistance,
      faultCarrier: _Fields.faultCarrier,
      customer: SetTicketDataTicketCustomerMapper().fromJson(
        json[_Fields.customer],
      ),
      marketingCampaign: SetTicketDataTicketMarketingCampaignMapper().fromJson(
        json[_Fields.marketingCampaign],
      ),
      busstationFee: _Fields.busstationFee,
      manualEntryOfTickets: _Fields.manualEntryOfTickets,
    );
  }
}
