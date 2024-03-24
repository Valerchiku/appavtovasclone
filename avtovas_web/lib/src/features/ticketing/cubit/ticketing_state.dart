part of 'ticketing_cubit.dart';

final class TicketingState extends Equatable {
  final CustomRoute route;
  final SingleTrip? trip;
  final StartSaleSession? saleSession;
  final List<OccupiedSeat>? occupiedSeat;
  final List<Passenger> passengers;
  final List<PersonalData> personalDataList;
  final List<String> seats;
  final List<Passenger>? existentPassengers;
  final List<String>? availableEmails;
  final List<bool> surnameStatuses;
  final AddTicket? addTicket;
  final List<bool> genderErrors;
  final String usedEmail;
  final bool useSavedEmail;
  final bool isLoading;
  final String errorMessage;
  final bool isErrorRead;
  final bool shouldShowErrorAlert;
  final List<AuxiliaryAddTicket> auxiliaryAddTicket;
  final List<String> rates;
  final String? orderNum;
  final String userPhoneNumber;
  final String tripDbName;
  final bool shouldShowEmptyTripMessage;
  final bool shouldShowSaleSessionError;

  @override
  List<Object?> get props => [
        route,
        trip,
        saleSession,
        occupiedSeat,
        passengers,
        personalDataList,
        seats,
        availableEmails,
        existentPassengers,
        addTicket,
        surnameStatuses,
        genderErrors,
        usedEmail,
        useSavedEmail,
        isLoading,
        errorMessage,
        isErrorRead,
        shouldShowErrorAlert,
        auxiliaryAddTicket,
        rates,
        userPhoneNumber,
        orderNum,
        tripDbName,
        shouldShowEmptyTripMessage,
        shouldShowSaleSessionError,
      ];

  const TicketingState({
    required this.route,
    required this.trip,
    required this.saleSession,
    required this.occupiedSeat,
    required this.passengers,
    required this.personalDataList,
    required this.seats,
    required this.existentPassengers,
    required this.availableEmails,
    required this.addTicket,
    required this.surnameStatuses,
    required this.genderErrors,
    required this.usedEmail,
    required this.useSavedEmail,
    required this.isLoading,
    required this.isErrorRead,
    required this.errorMessage,
    required this.shouldShowErrorAlert,
    required this.auxiliaryAddTicket,
    required this.rates,
    required this.userPhoneNumber,
    required this.orderNum,
    required this.tripDbName,
    required this.shouldShowEmptyTripMessage,
    required this.shouldShowSaleSessionError,
  });

  TicketingState copyWith({
    CustomRoute? route,
    SingleTrip? trip,
    StartSaleSession? saleSession,
    List<OccupiedSeat>? occupiedSeat,
    List<Passenger>? passengers,
    List<PersonalData>? personalDataList,
    List<String>? seats,
    List<Passenger>? existentPassengers,
    List<String>? availableEmails,
    AddTicket? addTicket,
    List<bool>? surnameStatuses,
    List<bool>? genderErrors,
    String? usedEmail,
    bool? useSavedEmail,
    bool shouldClearExistentPassengers = false,
    bool shouldClearEmails = false,
    bool? isLoading,
    String? errorMessage,
    bool? isErrorRead,
    bool? shouldShowErrorAlert,
    List<AuxiliaryAddTicket>? auxiliaryAddTicket,
    List<String>? rates,
    String? orderNum,
    String? userPhoneNumber,
    String? tripDbName,
    bool? shouldShowEmptyTripMessage,
    bool? shouldShowSaleSessionError,
  }) {
    return TicketingState(
      route: route ?? this.route,
      trip: trip ?? this.trip,
      saleSession: saleSession ?? this.saleSession,
      occupiedSeat: occupiedSeat ?? this.occupiedSeat,
      passengers: passengers ?? this.passengers,
      personalDataList: personalDataList ?? this.personalDataList,
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
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isErrorRead: isErrorRead ?? this.isErrorRead,
      shouldShowErrorAlert: shouldShowErrorAlert ?? this.shouldShowErrorAlert,
      auxiliaryAddTicket: auxiliaryAddTicket ?? this.auxiliaryAddTicket,
      rates: rates ?? this.rates,
      orderNum: orderNum ?? this.orderNum,
      userPhoneNumber: userPhoneNumber ?? this.userPhoneNumber,
      tripDbName: tripDbName ?? this.tripDbName,
      shouldShowEmptyTripMessage:
          shouldShowEmptyTripMessage ?? this.shouldShowEmptyTripMessage,
      shouldShowSaleSessionError:
          shouldShowSaleSessionError ?? this.shouldShowSaleSessionError,
    );
  }
}
