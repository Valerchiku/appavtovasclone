import 'package:core/domain/entities/domain_object.dart';

final class AddTicketReturnPaymentItem extends DomainObject {
  final String paymentType;
  final String amount;
  final String terminalNum;
  final String paymentSystemOrderNum;
  final String paymentCardKind;
  final String paymentCardNum;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        paymentType,
        amount,
        terminalNum,
        paymentSystemOrderNum,
        paymentCardKind,
        paymentCardNum,
      ];

  const AddTicketReturnPaymentItem({
    required this.paymentType,
    required this.amount,
    required this.terminalNum,
    required this.paymentSystemOrderNum,
    required this.paymentCardKind,
    required this.paymentCardNum,
  });

  @override
  AddTicketReturnPaymentItem copyWith() {
    return AddTicketReturnPaymentItem(
      paymentType: paymentType,
      amount: amount,
      terminalNum: terminalNum,
      paymentSystemOrderNum: paymentSystemOrderNum,
      paymentCardKind: paymentCardKind,
      paymentCardNum: paymentCardNum,
    );
  }
}
