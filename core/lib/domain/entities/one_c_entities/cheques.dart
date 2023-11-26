import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/one_c_entities/cheque_line.dart';
import 'package:core/domain/entities/return_one_c_payment/return_one_c_payment_fical_section.dart';
import 'package:core/domain/entities/return_one_c_payment/return_one_c_payment_position_puryevor.dart';

final class Cheque extends DomainObject {
  final List<ChequeLine>? chequeLines;
  final String barcode;
  final String fiscal;
  final String fiscalSum;
  final String caption;
  final String sticker;
  final ReturnOneCPaymentFiscalSection fiscalSection;
  final String dBDocNum;
  final String parentDoc;
  final ReturnOneCPaymentPosition positions;

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