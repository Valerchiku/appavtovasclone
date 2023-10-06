import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/mock_ticket.dart';
import 'package:common/src/utils/pdf_templates/pdf_footer_header_widget.dart';
import 'package:common/src/utils/pdf_templates/pdf_table_widget.dart';
import 'package:common/src/utils/pdf_templates/pdf_text_widget.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

abstract final class PDFTemplates {
  static pw.Column paymentAndReturnTemplate({
    required MockTicket mockTicket,
    required pw.Widget image,
    required Font font,
    required Font boldFont,
    required bool isReturnTicket,
  }) {
    // Colors
    const greenHex = '006455';
    const whiteHex = 'FFFFFF';

    // Text Styles
    final sizeHeadlineMedium = pw.TextStyle(
      font: boldFont,
      fontSize: CommonFonts.sizeHeadlineMedium,
      fontWeight: FontWeight.bold,
      color: PdfColor.fromHex(greenHex),
    );
    final sizeHeadlineSmall = pw.TextStyle(
      font: font,
      fontSize: CommonFonts.sizeHeadlineSmall,
      color: PdfColor.fromHex(greenHex),
    );
    final sizeTitleMedium = pw.TextStyle(
      font: font,
      fontSize: CommonFonts.sizeTitleMedium,
    );
    final sizeTitleMediumWhite = pw.TextStyle(
      font: font,
      fontSize: CommonFonts.sizeTitleMedium,
      color: PdfColor.fromHex(whiteHex),
    );
    final sizeFontSmall = pw.TextStyle(
      font: font,
      fontSize: CommonFonts.sizeFontSmall,
    );

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        PDFFooterHeaderWidget.header(
          image: image,
          sizeHeadlineMedium: sizeHeadlineMedium,
          isReturnTicket: isReturnTicket,
        ),
        pw.Divider(
          color: PdfColor.fromHex(greenHex),
          thickness: 2,
        ),
        PDFFooterHeaderWidget.mainTicketDetails(
          sizeHeadlineSmall: sizeHeadlineSmall,
          sizeTitleMedium: sizeTitleMedium,
          isReturnTicket: isReturnTicket,
        ),
        pw.SizedBox(height: 10),
        PDFTextWidget.sizeHeadlineSmallText(
          text: 'Пассажиры',
          sizeHeadlineSmall: sizeHeadlineSmall,
        ),
        pw.SizedBox(height: 5),
        PDFTableWidget.passengerTable(
          greenHex: greenHex,
          sizeTitleMedium: sizeTitleMedium,
          sizeTitleMediumWhite: sizeTitleMediumWhite,
          mockTicket: mockTicket,
        ),
        pw.SizedBox(height: 10),
        PDFTextWidget.sizeHeadlineSmallText(
          text: 'Данные рейса',
          sizeHeadlineSmall: sizeHeadlineSmall,
        ),
        pw.SizedBox(height: 5),
        PDFTableWidget.flightDetails(
          greenHex: greenHex,
          sizeTitleMedium: sizeTitleMedium,
          sizeTitleMediumWhite: sizeTitleMediumWhite,
          mockTicket: mockTicket,
        ),
        pw.SizedBox(height: 10),
        PDFTextWidget.sizeHeadlineSmallText(
          text: isReturnTicket == true
              ? 'Информация о возврате'
              : 'Информация об оплате',
          sizeHeadlineSmall: sizeHeadlineSmall,
        ),
        pw.SizedBox(height: 5),
        PDFTableWidget.priceDetails(
          greenHex: greenHex,
          sizeTitleMedium: sizeTitleMedium,
          sizeTitleMediumWhite: sizeTitleMediumWhite,
          isReturnTicket: isReturnTicket,
          mockTicket: mockTicket,
        ),
        pw.SizedBox(height: 10),
        pw.Divider(
          color: PdfColor.fromHex(greenHex),
          thickness: 2,
        ),
        PDFFooterHeaderWidget.specialNote(
          sizeHeadlineSmall: sizeHeadlineSmall,
          sizeFontSmall: sizeFontSmall,
        ),
        pw.Spacer(),
        PDFFooterHeaderWidget.supportEmails(
          sizeFontSmall: sizeFontSmall,
        ),
      ],
    );
  }
}
