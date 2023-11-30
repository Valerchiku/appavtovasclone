import 'dart:io';

import 'package:avtovas_mobile/src/common/mail_sender/mail_sender.dart';
import 'package:avtovas_mobile/src/common/notification_helper/notification_helper.dart';
import 'package:common/avtovas_common.dart';
// ignore: implementation_imports
import 'package:common/src/utils/mock_ticket.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PDFGenerator {
  static Future<void> generateAndShowTicketPDF({
    required BuildContext buildContext,
    required StatusedTrip statusedTrip,
    required bool isEmailSending,
    required bool isReturnTicket,
  }) async {
    const mockTicket = TicketMocks.mock;

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
            mockTicket: mockTicket,
            image: pw.Image(logoImage),
            font: normalFont,
            boldFont: boldFont,
            isReturnTicket: isReturnTicket,
            statusedTrip: statusedTrip,
          );
        },
      ),
    );

    final downloadsDirectory = await DownloadsPath.downloadsDirectory();
    final pdfFile = File(
      '${downloadsDirectory?.path}/ticketNo921Uiid3929392.pdf',
    );
    await pdfFile.writeAsBytes(await pdfDocument.save());

    if (isEmailSending == true) {
      MailSender.bookingConfirmation(
        // TODO(dev): Replace this with real data
        recipients: 'tasm86688@gmail.com',
        filePath: pdfFile.path,
        // TODO(dev): Replace this with real data
        fullName: 'John Doe Smith',
        departureDate: mockTicket.departureDateTime,
        departureStation: mockTicket.departureStation,
        arrivalStation: mockTicket.arrivalStation,
        // TODO(dev): Replace this with real data
        seats: ['1', '2'],
      );
    } else {
      NotificationHelper.showNotification(
        file: pdfFile,
        title: 'AVTOVAS',
        body: 'Your ticket has been successfully downloaded. Tap to view.',
      );
    }
  }
}
