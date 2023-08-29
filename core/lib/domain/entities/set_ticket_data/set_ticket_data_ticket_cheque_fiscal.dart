import 'package:core/domain/entities/domain_object.dart';

final class SetTicketDataTicketChequeFiscalSection extends DomainObject {
  final String sectionNumber;
  final String sectionSum;
  final String tax;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        sectionNumber,
        sectionSum,
        tax,
      ];

  const SetTicketDataTicketChequeFiscalSection({
      required this.sectionNumber,
      required this.sectionSum,
      required this.tax,
  });

  @override
  SetTicketDataTicketChequeFiscalSection copyWith() {
    return SetTicketDataTicketChequeFiscalSection(
      sectionNumber: sectionNumber,
      sectionSum: sectionSum,
      tax: tax,
    );
  }
}
