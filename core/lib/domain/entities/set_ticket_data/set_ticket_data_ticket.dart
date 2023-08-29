import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_additional_attribute.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_calculation.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_cheque.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_customer.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_departure.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_marketing_campaign.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_personal_data.dart';

final class SetTicketDataTicket extends DomainObject {
  final String number;
  final String date;
  final String tripId;
  final String carrier;
  final String parentTicketSeatNum;
  final String seatType;
  final String seatNum;
  final String fareName;
  final String privilageName;
  final SetTicketDataTicketCalculation calculation;
  final SetTicketDataTicketDeparture departure;
  final String departureTime;
  final SetTicketDataTicketDeparture destination;
  final String arrivalTime;
  final String distance;
  final String passengerName;
  final String passengerDoc;
  final SetTicketDataTicketPersonalData personalData;
  final List<SetTicketDataTicketAdditionalAttribute> addtionalAttributes;
  final List<SetTicketDataTicketCheque> cheques;
  final String absence;
  final String faultDistance;
  final String faultCarrier;
  final SetTicketDataTicketCustomer customer;
  final SetTicketDataTicketMarketingCampaign marketingCampaign;
  final String busStationFee;
  final String manualEntryOfTickets;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
          number,
          date,
          tripId,
          carrier,
          parentTicketSeatNum,
          seatType,
          seatNum,
          fareName,
          privilageName,
          calculation,
          departure,
          departureTime,
          destination,
          arrivalTime,
          distance,
          passengerName,
          passengerDoc,
          personalData,
          addtionalAttributes,
          cheques,
          absence,
          faultDistance,
          faultCarrier,
          customer,
          marketingCampaign,
          busStationFee,
          manualEntryOfTickets,
      ];

  const SetTicketDataTicket({
    required this.number,
    required this.date,
    required this.tripId,
    required this.carrier,
    required this.parentTicketSeatNum,
    required this.seatType,
    required this.seatNum,
    required this.fareName,
    required this.privilageName,
    required this.calculation,
    required this.departure,
    required this.departureTime,
    required this.destination,
    required this.arrivalTime,
    required this.distance,
    required this.passengerName,
    required this.passengerDoc,
    required this.personalData,
    required this.addtionalAttributes,
    required this.cheques,
    required this.absence,
    required this.faultDistance,
    required this.faultCarrier,
    required this.customer,
    required this.marketingCampaign,
    required this.busStationFee,
    required this.manualEntryOfTickets,
  });

  @override
  SetTicketDataTicket copyWith() {
    return SetTicketDataTicket(
      number: number,
      date: date,
      tripId: tripId,
      carrier: carrier,
      parentTicketSeatNum: parentTicketSeatNum,
      seatType: seatType,
      seatNum: seatNum,
      fareName: fareName,
      privilageName: privilageName,
      calculation: calculation,
      departure: departure,
      departureTime: departureTime,
      destination: destination,
      arrivalTime: arrivalTime,
      distance: distance,
      passengerName: passengerName,
      passengerDoc: passengerDoc,
      personalData: personalData,
      addtionalAttributes: addtionalAttributes,
      cheques: cheques,
      absence: absence,
      faultDistance: faultDistance,
      faultCarrier: faultCarrier,
      customer: customer,
      marketingCampaign: marketingCampaign,
      busStationFee: busStationFee,
      manualEntryOfTickets: manualEntryOfTickets,
    );
  }
}
