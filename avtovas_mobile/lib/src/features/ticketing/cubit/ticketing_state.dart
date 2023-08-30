part of 'ticketing_cubit.dart';

final class TicketingState extends Equatable {
  final StartSaleSession? saleSession;
  final OccupiedSeat? occupiedSeat;
  final List<Passenger?> passenger;
  final String firstName;
  final String lastName;
  final String? surname;
  final bool withoutSurname;
  final Genders currentGender;
  final String documentType;
  final String currentCountry;
  final Rates currentRate;
  final String currentPlace;

  @override
  List<Object?> get props => [
        saleSession,
        occupiedSeat,
        passenger,
        firstName,
        lastName,
        surname,
        withoutSurname,
        currentGender,
        documentType,
        currentCountry,
        currentRate,
        currentPlace,
      ];

  const TicketingState({
    required this.saleSession,
    required this.occupiedSeat,
    required this.passenger,
    required this.firstName,
    required this.lastName,
    required this.withoutSurname,
    required this.currentGender,
    required this.documentType,
    required this.currentCountry,
    required this.currentRate,
    required this.currentPlace,
    this.surname,
  });

  TicketingState copyWith({
    StartSaleSession? saleSession,
    OccupiedSeat? occupiedSeat,
    List<Passenger>? passenger,
    String? firstName,
    String? lastName,
    String? surname,
    bool? withoutSurname,
    Genders? currentGender,
    String? documentType,
    String? currentCountry,
    Rates? currentRate,
    String? currentPlace,
  }) {
    return TicketingState(
      saleSession: saleSession ?? this.saleSession,
      occupiedSeat: occupiedSeat ?? this.occupiedSeat,
      passenger: passenger ?? this.passenger,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      surname: surname ?? this.surname,
      withoutSurname: withoutSurname ?? this.withoutSurname,
      currentGender: currentGender ?? this.currentGender,
      documentType: documentType ?? this.documentType,
      currentCountry: currentCountry ?? this.currentCountry,
      currentRate: currentRate ?? this.currentRate,
      currentPlace: currentPlace ?? this.currentPlace,
    );
  }
}
