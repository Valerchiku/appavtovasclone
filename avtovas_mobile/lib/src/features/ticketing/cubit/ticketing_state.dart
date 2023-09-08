part of 'ticketing_cubit.dart';

final class TicketingState extends Equatable {
  final CustomRoute route;
  final StartSaleSession? saleSession;
  final List<OccupiedSeat>? occupiedSeat;
  final List<Passenger> passengers;
  final List<String> seats;
  final List<Passenger>? existentPassengers;
  final List<String>? availableEmails;
  final List<bool> surnameStatuses;
  final AddTicket? addTicket;
  final List<bool> genderErrors;
  final String usedEmail;
  final bool useSavedEmail;

  @override
  List<Object?> get props => [
        route,
        saleSession,
        occupiedSeat,
        passengers,
    seats,
        availableEmails,
        existentPassengers,

        addTicket,
        surnameStatuses,
        genderErrors,
        usedEmail,
        useSavedEmail,
      ];

  const TicketingState({
    required this.route,
    required this.saleSession,
    required this.occupiedSeat,
    required this.passengers,
    required this.seats,
    required this.existentPassengers,
    required this.availableEmails,
    required this.addTicket,
    required this.surnameStatuses,
    required this.genderErrors,
    required this.usedEmail,
    required this.useSavedEmail,
  });

  TicketingState copyWith({
    CustomRoute? route,
    StartSaleSession? saleSession,
    List<OccupiedSeat>? occupiedSeat,
    List<Passenger>? passengers,
    List<String>? seats,
    List<Passenger>? existentPassengers,
    List<String>? availableEmails,
    AddTicket? addTicket,
    List<PersonalData>? personalDataList,
    List<bool>? surnameStatuses,
    List<bool>? genderErrors,
    String? usedEmail,
    bool? useSavedEmail,
    bool shouldClearExistentPassengers = false,
    bool shouldClearEmails = false,
  }) {
    return TicketingState(
      route: route ?? this.route,
      saleSession: saleSession ?? this.saleSession,
      occupiedSeat: occupiedSeat ?? this.occupiedSeat,
      passengers: passengers ?? this.passengers,
      seats: seats ?? this.seats,
      existentPassengers: shouldClearExistentPassengers
          ? existentPassengers
          : existentPassengers ?? this.existentPassengers,
      availableEmails: shouldClearEmails
          ? availableEmails
          : availableEmails ?? this.availableEmails,
      addTicket: addTicket ?? this.addTicket,
      genderErrors: genderErrors ?? this.genderErrors,
      surnameStatuses: surnameStatuses ?? this.surnameStatuses,
      usedEmail: usedEmail ?? this.usedEmail,
      useSavedEmail: useSavedEmail ?? this.useSavedEmail,
    );
  }
}
