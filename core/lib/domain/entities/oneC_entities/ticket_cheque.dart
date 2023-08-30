import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/oneC_entities/ticket_cheque_fiscal.dart';
import 'package:core/domain/entities/oneC_entities/ticket_cheque_pos.dart';

final class TicketCheque extends DomainObject {
  final List<String> chequeLines;
  final String barcode;
  final String fiscal;
  final String fiscalSum;
  final String caption;
  final String sticker;
  final String printed;
  final List<TicketChequeFiscalSection> fiscalSection;
  final String chequeID;
  final String dbDocNum;
  final String parentDoc;
  final List<TicketChequePos> positions;
  final String qrCode;

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
        printed,
        fiscalSection,
        chequeID,
        dbDocNum,
        parentDoc,
        positions,
        qrCode,
      ];

  const TicketCheque({
      required this.chequeLines,
      required this.barcode,
      required this.fiscal,
      required this.fiscalSum,
      required this.caption,
      required this.sticker,
      required this.printed,
      required this.fiscalSection,
      required this.chequeID,
      required this.dbDocNum,
      required this.parentDoc,
      required this.positions,
      required this.qrCode,
  });

  @override
  TicketCheque copyWith() {
    return TicketCheque(
      chequeLines: chequeLines,
      barcode: barcode,
      fiscal: fiscal,
      fiscalSum: fiscalSum,
      caption: caption,
      sticker: sticker,
      printed: printed,
      fiscalSection: fiscalSection,
      chequeID: chequeID,
      dbDocNum: dbDocNum,
      parentDoc: parentDoc,
      positions: positions,
      qrCode: qrCode,
    );
  }
}