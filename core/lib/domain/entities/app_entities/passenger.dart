import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/utils/date_time_ext.dart';

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
    bool shouldClearSurname = false,
  }) {
    return Passenger(
      uuid: uuid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      surname: shouldClearSurname ? surname : surname ?? this.surname,
      gender: gender ?? this.gender,
      birthdayDate: birthdayDate ?? this.birthdayDate,
      citizenship: citizenship ?? this.citizenship,
      documentType: documentType ?? this.documentType,
      documentData: documentData ?? this.documentData,
      rate: rate ?? this.rate,
    );
  }

  Passenger.empty()
      : uuid = generateUuid(),
        firstName = '',
        lastName = '',
        surname = null,
        gender = '',
        birthdayDate = DateTime.now().copyWith(year: DateTime.now().year + 1),
        citizenship = '',
        documentType = '',
        documentData = '',
        rate = '';

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      surname.hashCode ^
      gender.hashCode ^
      birthdayDate.hashCode ^
      citizenship.hashCode ^
      documentType.hashCode ^
      documentData.hashCode ^
      rate.hashCode;

  @override
  bool operator ==(Object other) {
    return other is Passenger &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        surname == other.surname &&
        gender == other.gender &&
        birthdayDate.isEqualDate(other.birthdayDate) &&
        citizenship == other.citizenship &&
        documentType == other.documentType &&
        documentData == other.documentData &&
        rate == other.rate;
  }
}
