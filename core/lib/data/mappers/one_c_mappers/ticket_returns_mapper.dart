import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/one_c_mappers/cheque_mapper.dart';
import 'package:core/data/mappers/one_c_mappers/ticket_mapper.dart';
import 'package:core/domain/entities/one_c_entities/ticket_returns.dart';

final class TicketReturnsMapper implements BaseMapper<TicketReturns> {
  @override
  Map<String, dynamic> toJson(TicketReturns data) {
    return {
      _Fields.number: data.number,
      _Fields.returnKind: data.returnKind,
      _Fields.needExplanation: data.needExplanation,
      _Fields.explanation: data.explanation,
      _Fields.cheques: data.cheques,
      _Fields.returnKindDescription: data.returnKindDescription,
      _Fields.fareToReturn: data.fareToReturn,
      _Fields.sumToReturn: data.sumToReturn,
      _Fields.faultDistance: data.faultDistance,
    };
  }

  @override
  TicketReturns fromJson(Map<String, dynamic> json) {
    final jsonCheques = json[_Fields.cheques];
    final jsonTicket = json[_Fields.ticket];

    return TicketReturns(
      number: json[_Fields.number] ?? '',
      ticket: jsonTicket is List<dynamic>
          ? jsonTicket.map((e) => TicketMapper().fromJson(e)).toList()
          : [TicketMapper().fromJson(jsonTicket)],
      returnKind: json[_Fields.returnKind] ?? '',
      needExplanation: json[_Fields.needExplanation] ?? '',
      explanation: json[_Fields.explanation] ?? '',
      cheques: jsonCheques is List<dynamic>
          ? jsonCheques.map((e) => ChequeMapper().fromJson(e)).toList()
          : [ChequeMapper().fromJson(jsonCheques)],
      returnKindDescription: json[_Fields.returnKindDescription] ?? '',
      fareToReturn: json[_Fields.fareToReturn] ?? '',
      sumToReturn: json[_Fields.sumToReturn] ?? '',
      faultDistance: json[_Fields.faultDistance] ?? '',
    );
  }
}

abstract final class _Fields {
  static const number = 'Number';
  static const ticket = 'Ticket';
  static const returnKind = 'ReturnKind';
  static const needExplanation = 'NeedExplanation';
  static const explanation = 'Explanation';
  static const cheques = 'Cheques';
  static const returnKindDescription = 'ReturnKindDescription';
  static const fareToReturn = 'FareToReturn';
  static const sumToReturn = 'SumToReturn';
  static const faultDistance = 'FaultDistance';
}
