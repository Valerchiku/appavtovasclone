import 'package:core/domain/entities/domain_object.dart';

final class TicketChequePosPurveyorData extends DomainObject {
  
final String name;
final String taxId;
final String phone;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        taxId,
        phone,
      ];

  const TicketChequePosPurveyorData({
      required this.name,
      required this.taxId,
      required this.phone,
  });

  @override
  TicketChequePosPurveyorData copyWith() {
    return TicketChequePosPurveyorData(
      name: name,
      taxId: taxId,
      phone: phone,
    );
  }
}