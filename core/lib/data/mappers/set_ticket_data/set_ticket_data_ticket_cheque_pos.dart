import 'package:core/domain/entities/domain_object.dart';

final class SetTicketDataTicketChequePos extends DomainObject {
  
final String name;
final String sumWithDiscount;
final String sumWithDiscount;
final String fiscalSectionNumber;
final String vat;
final String vat54fl;
final List<SetTicketDataTicketChequePosPurveyorData> purveyorData;
final String signCalculationObject;
final String signMethodCalculation;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        sumWithDiscount,
        sumWithDiscount,
        fiscalSectionNumber,
        vat,
        vat54fl,
        purveyorData,
        signCalculationObject,
        signMethodCalculation,
      ];

  const SetTicketDataTicketChequePos({
      this.name,
      this.sumWithDiscount,
      this.sumWithDiscount,
      this.fiscalSectionNumber,
      this.vat,
      this.vat54fl,
      this.purveyorData,
      this.signCalculationObject,
      this.signMethodCalculation,
  });

  @override
  SetTicketDataTicketChequePos copyWith() {
    return SetTicketDataTicketChequePos(
      name: name,
      sumWithDiscount: sumWithDiscount,
      sumWithDiscount: sumWithDiscount,
      fiscalSectionNumber: fiscalSectionNumber,
      vat: vat,
      vat54fl: vat54fl,
      purveyorData: purveyorData,
      signCalculationObject: signCalculationObject,
      signMethodCalculation: signMethodCalculation,
    );
  }
}
