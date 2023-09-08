import 'package:core/domain/entities/domain_object.dart';

final class ReturnPaymentChequeLines extends DomainObject {
  final String? chequeLines;
  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        chequeLines,
      ];

  const ReturnPaymentChequeLines({
    required this.chequeLines,
  });

  @override
  ReturnPaymentChequeLines copyWith() {
    return ReturnPaymentChequeLines(
      chequeLines: chequeLines,
    );
  }
}
