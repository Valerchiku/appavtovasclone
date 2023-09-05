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
        citizenship
      ];

  const PersonalData({
    this.ticketNumber,
    this.seatNum,
    this.fareName,
    this.fullName,
    this.documentNum,
    this.documentType,
    this.dateOfBirth,
    this.gender,
    this.citizenship,
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
}
