import 'package:core/domain/entities/domain_object.dart';

final class Passenger extends DomainObject {
  final String uuid;
  final String firstName;
  final String lastName;
  final String? surname;
  final String gender;
  final DateTime birthdayDate;
  final String citizenship;
  final String documentType;
  final String documentData;
  final String rate;

  const Passenger({
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthdayDate,
    required this.citizenship,
    required this.documentType,
    required this.documentData,
    required this.rate,
    this.surname,
  });

  @override
  List<Object?> get props => [
        uuid,
        firstName,
        lastName,
        gender,
        birthdayDate,
        citizenship,
        documentType,
        documentData,
        rate,
        surname,
      ];

  @override
  Passenger copyWith({
    String? firstName,
    String? lastName,
    String? surname,
    String? gender,
    DateTime? birthdayDate,
    String? citizenship,
    String? documentType,
    String? documentData,
    String? rate,
  }) {
    return Passenger(
      uuid: uuid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      surname: surname ?? this.surname,
      gender: gender ?? this.gender,
      birthdayDate: birthdayDate ?? this.birthdayDate,
      citizenship: citizenship ?? this.citizenship,
      documentType: documentType ?? this.documentType,
      documentData: documentData ?? this.documentData,
      rate: rate ?? this.rate,
    );
  }
}
