import 'package:core/domain/entities/domain_object.dart';

final class ReturnOneCPaymentFiscalSection extends DomainObject {
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

  const ReturnOneCPaymentFiscalSection({
    required this.sectionNumber,
    required this.sectionSum,
    required this.tax,
  });

  @override
  ReturnOneCPaymentFiscalSection copyWith() {
    return ReturnOneCPaymentFiscalSection(
      sectionNumber: sectionNumber,
      sectionSum: sectionSum,
      tax: tax,
    );
  }
}
