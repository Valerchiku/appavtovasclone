import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_cheque_pos_purveyor.dart';

final class SetTicketDataTicketChequePos extends DomainObject {
  final String name;
  final String sumWithDiscount;
  final String sum54FLWithDiscount;
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
        sum54FLWithDiscount,
        fiscalSectionNumber,
        vat,
        vat54fl,
        purveyorData,
        signCalculationObject,
        signMethodCalculation,
      ];

  const SetTicketDataTicketChequePos({
      required this.name,
      required this.sumWithDiscount,
      required this.sum54FLWithDiscount,
      required this.fiscalSectionNumber,
      required this.vat,
      required this.vat54fl,
      required this.purveyorData,
      required this.signCalculationObject,
      required this.signMethodCalculation,
  });

  @override
  SetTicketDataTicketChequePos copyWith() {
    return SetTicketDataTicketChequePos(
      name: name,
      sumWithDiscount: sumWithDiscount,
      sum54FLWithDiscount: sum54FLWithDiscount,
      fiscalSectionNumber: fiscalSectionNumber,
      vat: vat,
      vat54fl: vat54fl,
      purveyorData: purveyorData,
      signCalculationObject: signCalculationObject,
      signMethodCalculation: signMethodCalculation,
    );
  }
}
