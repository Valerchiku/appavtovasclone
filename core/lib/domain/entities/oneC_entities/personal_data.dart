import 'package:core/domain/entities/domain_object.dart';

final class PersonalData extends DomainObject {
  final String ticketNumber;
  final String seatNum;
  final String fareName;
  final String firstName;
  final String lastName;
  final String? surname;
  final String documentNum;
  final String documentType;
  final String dateOfBirth;
  final String gender;
  final String citizenship;
  final String rate;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        ticketNumber,
        seatNum,
        fareName,
        firstName,
        lastName,
        surname,
        documentNum,
        documentType,
        dateOfBirth,
        gender,
        citizenship,
        rate,
      ];

  const PersonalData({
    required this.ticketNumber,
    required this.seatNum,
    required this.fareName,
    required this.firstName,
    required this.lastName,
    required this.documentNum,
    required this.documentType,
    required this.dateOfBirth,
    required this.gender,
    required this.citizenship,
    required this.rate,
    this.surname,
  });

  @override
  PersonalData copyWith({
    String? ticketNumber,
    String? seatNum,
    String? fareName,
    String? firstName,
    String? lastName,
    String? surname,
    String? documentNum,
    String? documentType,
    String? dateOfBirth,
    String? gender,
    String? citizenship,
    String? rate,
  }) {
    return PersonalData(
      ticketNumber: ticketNumber ?? this.ticketNumber,
      seatNum: seatNum ?? this.seatNum,
      fareName: fareName ?? this.fareName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      surname: surname ?? this.surname,
      documentNum: documentNum ?? this.documentNum,
      documentType: documentType ?? this.documentType,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      citizenship: citizenship ?? this.citizenship,
      rate: rate ?? this.rate,
    );
  }

  const PersonalData.empty()
      : ticketNumber = '11',
        seatNum = '1',
        fareName = '',
        firstName = '',
        lastName = '',
        surname = '',
        documentNum = '',
        documentType = '',
        dateOfBirth = '',
        gender = '',
        citizenship = '',
        rate = '';
}
