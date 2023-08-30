import 'package:core/domain/entities/domain_object.dart';

final class TicketChequeFiscalSection extends DomainObject {
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

  const TicketChequeFiscalSection({
      required this.sectionNumber,
      required this.sectionSum,
      required this.tax,
  });

  @override
  TicketChequeFiscalSection copyWith() {
    return TicketChequeFiscalSection(
      sectionNumber: sectionNumber,
      sectionSum: sectionSum,
      tax: tax,
    );
  }
}