part of 'ticketing_cubit.dart';

final class TicketingState extends Equatable {
  final String firstName;
  final String lastName;
  final String? surname;
  final bool withoutSurname;
  final Genders currentGender;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        surname,
        withoutSurname,
        currentGender,
      ];

  const TicketingState({
    required this.firstName,
    required this.lastName,
    required this.withoutSurname,
    required this.currentGender,
    this.surname,
  });

  TicketingState copyWith({
    String? firstName,
    String? lastName,
    String? surname,
    bool? withoutSurname,
    Genders? currentGender,
  }) {
    return TicketingState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      surname: surname ?? this.surname,
      withoutSurname: withoutSurname ?? this.withoutSurname,
      currentGender: currentGender ?? this.currentGender,
    );
  }
}
