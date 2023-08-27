import 'package:core/domain/entities/domain_object.dart';

final class SetTicketDataTicketCheque extends DomainObject {
  
final List<String> chequeLines;
final String barcode;
final String fiscal;
final String fiscalSum;
final String caption;
final String sticker;
final String printed;
final List<FiscalSection> fiscalSection;
final String chequeID;
final String dbDocNum;
final String parentDoc;
final List<SetTicketDataTicketChequePos> positions;
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

  const SetTicketDataTicketCheque({
      this.chequeLines,
      this.barcode,
      this.fiscal,
      this.fiscalSum,
      this.caption,
      this.sticker,
      this.printed,
      this.fiscalSection,
      this.chequeID,
      this.dbDocNum,
      this.parentDoc,
      this.positions,
      this.qrCode,
  });

  @override
  SetTicketDataTicketCheque copyWith() {
    return SetTicketDataTicketCheque(
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
