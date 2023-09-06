import 'package:core/domain/entities/domain_object.dart';

final class PersonalData extends DomainObject {
  final String? ticketNumber;
  final String? seatNum;
  final String? fareName;
  final String? fullName;
  final String? documentNum;
  final String? documentType;
  final String? dateOfBirth;
  final String? gender;
  final String? citizenship;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        ticketNumber,
        seatNum,
        fareName,
        fullName,
        documentNum,
        documentType,
        dateOfBirth,
        gender,
        citizenship,
      ];

  const PersonalData({
    required this.ticketNumber,
    required this.seatNum,
    required this.fareName,
    required this.fullName,
    required this.documentNum,
    required this.documentType,
    required this.dateOfBirth,
    required this.gender,
    required this.citizenship,
  });

  @override
  PersonalData copyWith({
    String? ticketNumber,
    String? seatNum,
    String? fareName,
    String? fullName,
    String? documentNum,
    String? documentType,
    String? dateOfBirth,
    String? gender,
    String? citizenship,
  }) {
    return PersonalData(
      ticketNumber: ticketNumber ?? this.ticketNumber,
      seatNum: seatNum ?? this.seatNum,
      fareName: fareName ?? this.fareName,
      fullName: fullName ?? this.fullName,
      documentNum: documentNum ?? this.documentNum,
      documentType: documentType ?? this.documentType,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      citizenship: citizenship ?? this.citizenship,
    );
  }

  PersonalData empty() {
    return PersonalData(
      ticketNumber: ticketNumber,
      seatNum: seatNum,
      fareName: fareName,
      fullName: fullName,
      documentNum: documentNum,
      documentType: documentType,
      dateOfBirth: dateOfBirth,
      gender: gender,
      citizenship: citizenship,
    );
  }
}
