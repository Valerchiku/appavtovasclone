import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/oneC_mappers/cheque_mapper.dart';
import 'package:core/domain/entities/oneC_entities/cheques.dart';
import 'package:core/domain/entities/oneC_entities/ticket_returns.dart';

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

    final cheques = <Cheque>[];

    if (jsonCheques is Map<String, dynamic>) {
      cheques.add(
        ChequeMapper().fromJson(jsonCheques),
      );
    } else if (jsonCheques is List<dynamic>) {
      cheques.addAll(
        jsonCheques.map(
          (el) => ChequeMapper().fromJson(
            el as Map<String, dynamic>,
          ),
        ),
      );
    }

    return TicketReturns(
      number: json[_Fields.number] ?? '',
      returnKind: json[_Fields.returnKind] ?? '',
      needExplanation: json[_Fields.needExplanation] ?? '',
      explanation: json[_Fields.explanation] ?? '',
      cheques: cheques,
      returnKindDescription: json[_Fields.returnKindDescription] ?? '',
      fareToReturn: json[_Fields.fareToReturn] ?? '',
      sumToReturn: json[_Fields.sumToReturn] ?? '',
      faultDistance: json[_Fields.faultDistance] ?? '',
    );
  }
}

abstract final class _Fields {
  static const number = 'Number';
  static const returnKind = 'ReturnKind';
  static const needExplanation = 'NeedExplanation';
  static const explanation = 'Explanation';
  static const cheques = 'Cheques';
  static const returnKindDescription = 'ReturnKindDescription';
  static const fareToReturn = 'FareToReturn';
  static const sumToReturn = 'SumToReturn';
  static const faultDistance = 'FaultDistance';
}
