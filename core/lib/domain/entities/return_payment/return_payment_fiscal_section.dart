import 'package:core/domain/entities/domain_object.dart';

final class ReturnPaymentFiscalSection extends DomainObject {
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

  const ReturnPaymentFiscalSection({
    required this.sectionNumber,
    required this.sectionSum,
    required this.tax,
  });

  @override
  ReturnPaymentFiscalSection copyWith() {
    return ReturnPaymentFiscalSection(
      sectionNumber: sectionNumber,
      sectionSum: sectionSum,
      tax: tax,
    );
  }
}
