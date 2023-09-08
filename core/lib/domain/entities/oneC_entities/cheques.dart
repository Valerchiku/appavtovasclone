import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/oneC_entities/cheque_lines.dart';
import 'package:core/domain/entities/return_payment/return_payment_fiscal_section.dart';
import 'package:core/domain/entities/return_payment/return_payment_position.dart';

final class Cheque extends DomainObject {
  final List<ChequeLine>? chequeLines;
  final String barcode;
  final String fiscal;
  final String fiscalSum;
  final String caption;
  final String sticker;
  final ReturnPaymentFiscalSection fiscalSection;
  final String dBDocNum;
  final String parentDoc;
  final ReturnPaymentPosition positions;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        chequeLines,
        barcode,
        fiscal,
        fiscalSum,
        caption,
        sticker,
        fiscalSection,
        dBDocNum,
        parentDoc,
        positions,
      ];

  const Cheque({
    required this.chequeLines,
    required this.barcode,
    required this.fiscal,
    required this.fiscalSum,
    required this.caption,
    required this.sticker,
    required this.fiscalSection,
    required this.dBDocNum,
    required this.parentDoc,
    required this.positions,
  });

  @override
  Cheque copyWith() {
    return Cheque(
      chequeLines: chequeLines,
      barcode: barcode,
      fiscal: fiscal,
      fiscalSum: fiscalSum,
      caption: caption,
      sticker: sticker,
      fiscalSection: fiscalSection,
      dBDocNum: dBDocNum,
      parentDoc: parentDoc,
      positions: positions,
    );
  }
}
