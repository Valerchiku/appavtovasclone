import 'package:core/domain/entities/domain_object.dart';

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
  final String personalData;
  final List<SetTicketDataTicketAdditionalAttribute> addtionalAttributes;
  final List<SetTicketDataTicketCheque> cheques;
  final String absence;
  final String faultDistance;
  final String faultCarrier;
  final SetTicketDataTicketCustomer customer;
  final SetTicketDataTicketMarketingCampaign marketingCampaign;
  final String busstationFee;
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
          busstationFee,
          manualEntryOfTickets,
      ];

  const SetTicketDataTicket({
    required this.number,
    this.date,
    this.tripId,
    this.carrier,
    this.parentTicketSeatNum,
    this.seatType,
    this.seatNum,
    this.fareName,
    this.privilageName,
    this.calculation,
    this.departure,
    this.departureTime,
    this.destination,
    this.arrivalTime,
    this.distance,
    this.passengerName,
    this.passengerDoc,
    required this.personalData,
    required this.addtionalAttributes,
    required this.cheques,
    this.absence,
    this.faultDistance,
    this.faultCarrier,
    this.customer,
    this.marketingCampaign,
    this.busstationFee,
    this.manualEntryOfTickets,
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
      busstationFee: busstationFee,
      manualEntryOfTickets: manualEntryOfTickets,
    );
  }
}
