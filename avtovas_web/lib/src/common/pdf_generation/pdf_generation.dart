import 'dart:typed_data';

import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as universal_html;

class PDFGenerator {
  static Future<Uint8List> generatePdfBytesArray({
    required BuildContext buildContext,
    required StatusedTrip statusedTrip,
    required bool isReturnTicket,
  }) async {
    final pdfDocument = pw.Document();

    // Load Fonts
    final normalFontData =
        await rootBundle.load('assets/fonts/Avtovas_Normal.ttf');
    final boldFontData = await rootBundle.load('assets/fonts/Avtovas_Bold.ttf');

    final normalFont = pw.Font.ttf(normalFontData);
    final boldFont = pw.Font.ttf(boldFontData);

    // Load AVTOVAS Logo
    final logoImageData =
        (await rootBundle.load('assets/images/avtovas_logo_green.png'))
            .buffer
            .asUint8List();
    final logoImage = pw.MemoryImage(logoImageData);

    pdfDocument.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return PDFTemplates.paymentAndReturnTemplate(
            context: buildContext,
            image: pw.Image(logoImage),
            font: normalFont,
            boldFont: boldFont,
            isReturnTicket: isReturnTicket,
            statusedTrip: statusedTrip,
          );
        },
      ),
    );

    final pdfBytes = await pdfDocument.save();

    return pdfBytes;
  }

  static Future<void> generateAndShowTicketPDF({
    required BuildContext buildContext,
    required StatusedTrip statusedTrip,
    required bool isEmailSending,
    required bool isReturnTicket,
  }) async {
    final pdfDocument = pw.Document();

    // Load Fonts
    final normalFontData =
        await rootBundle.load('assets/fonts/Avtovas_Normal.ttf');
    final boldFontData = await rootBundle.load('assets/fonts/Avtovas_Bold.ttf');

    final normalFont = pw.Font.ttf(normalFontData);
    final boldFont = pw.Font.ttf(boldFontData);

    // Load AVTOVAS Logo
    final logoImageData =
        (await rootBundle.load('assets/images/avtovas_logo_green.png'))
            .buffer
            .asUint8List();
    final logoImage = pw.MemoryImage(logoImageData);

    pdfDocument.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return PDFTemplates.paymentAndReturnTemplate(
            context: buildContext,
            image: pw.Image(logoImage),
            font: normalFont,
            boldFont: boldFont,
            isReturnTicket: isReturnTicket,
            statusedTrip: statusedTrip,
          );
        },
      ),
    );

    final pdfBytes = await pdfDocument.save();

    final blob = universal_html.Blob([Uint8List.fromList(pdfBytes)]);

    final url = universal_html.Url.createObjectUrlFromBlob(blob);

    final anchor = universal_html.AnchorElement(href: url)
      ..target = 'webflutterpdf'
      ..download = 'e-ticket.pdf';

    universal_html.document.body?.children.add(anchor);

    anchor.click();

    universal_html.Url.revokeObjectUrl(url);
    anchor.remove();
  }
}
