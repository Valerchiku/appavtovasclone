import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/pdf_templates/widgets/pdf_footer_header_widget/pdf_footer_header_widget.dart';
import 'package:common/src/utils/pdf_templates/widgets/pdf_table_widget/pdf_table_widget.dart';
import 'package:common/src/utils/pdf_templates/widgets/pdf_text_widget/pdf_text_widget.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

abstract final class PDFTemplates {
  static pw.Column paymentAndReturnTemplate({
    required BuildContext context,
    required pw.Widget image,
    required Font font,
    required Font boldFont,
    required bool isReturnTicket,
    required StatusedTrip statusedTrip,
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
          paymentId: statusedTrip.orderNum ?? '',
          routeId: context.locale.tripNumber(statusedTrip.trip.routeNum),
          purchaseDate: statusedTrip.saleDate.ticketDateFormat(),
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
          seats: statusedTrip.places,
          sizeTitleMedium: sizeTitleMedium,
          sizeTitleMediumWhite: sizeTitleMediumWhite,
          passengers: statusedTrip.passengers,
        ),
        pw.SizedBox(height: 10),
        PDFTextWidget.sizeHeadlineSmallText(
          text: 'Данные рейса',
          sizeHeadlineSmall: sizeHeadlineSmall,
        ),
        pw.SizedBox(height: 5),
        PDFTableWidget.flightDetails(
          singleTrip: statusedTrip.trip,
          greenHex: greenHex,
          sizeTitleMedium: sizeTitleMedium,
          sizeTitleMediumWhite: sizeTitleMediumWhite,
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
          context: context,
          singleTrip: statusedTrip.trip,
          passengerCount: statusedTrip.passengers.length,
          greenHex: greenHex,
          sizeTitleMedium: sizeTitleMedium,
          sizeTitleMediumWhite: sizeTitleMediumWhite,
          isReturnTicket: isReturnTicket,
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
