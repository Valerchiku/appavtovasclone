import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/add_ticket_return/add_ticket_return_payment.dart';

final class AddTicketReturnPaymentItemMapper
    implements BaseMapper<AddTicketReturnPaymentItem> {
  @override
  Map<String, dynamic> toJson(AddTicketReturnPaymentItem data) {
    return {
      _Fields.paymentType: data.paymentType,
      _Fields.amount: data.amount,
      _Fields.terminalNum: data.terminalNum,
      _Fields.paymentSystemOrderNum: data.paymentSystemOrderNum,
      _Fields.paymentCardKind: data.paymentCardKind,
      _Fields.paymentCardNum: data.paymentCardNum,
    };
  }

  @override
  AddTicketReturnPaymentItem fromJson(Map<String, dynamic> json) {
    return AddTicketReturnPaymentItem(
      paymentType: json[_Fields.paymentType] ?? '',
      amount: json[_Fields.amount] ?? '',
      terminalNum: json[_Fields.terminalNum] ?? '',
      paymentSystemOrderNum: json[_Fields.paymentSystemOrderNum] ?? '',
      paymentCardKind: json[_Fields.paymentCardKind] ?? '',
      paymentCardNum: json[_Fields.paymentCardNum] ?? '',
    );
  }
}

abstract final class _Fields {
  static const paymentType = 'PaymentType';
  static const amount = 'Amount';
  static const terminalNum = 'TerminalNum';
  static const paymentSystemOrderNum = 'PaymentSystemOrderNum';
  static const paymentCardKind = 'PaymentCardKind';
  static const paymentCardNum = 'PaymentCardNum';
}
