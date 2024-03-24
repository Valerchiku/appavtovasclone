import 'dart:io';
import 'dart:typed_data';

import 'package:avtovas_mobile/src/common/notification_helper/notification_helper.dart';
import 'package:common/avtovas_common.dart';

// ignore: implementation_imports
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PDFGenerator {
  static Future<void> generateAndShowTicketPDF({
    required BuildContext buildContext,
    required StatusedTrip statusedTrip,
    required bool isEmailSending,
    required bool isReturnTicket,
    String? userEmail,
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

    final downloadPath = AvtovasPlatform.isIOS
        ? await getTemporaryDirectory()
        : await DownloadsPath.downloadsDirectory();

    final pdfFile = File(
      '${downloadPath?.path}/ticket${statusedTrip.trip.id}.pdf',
    );
    await pdfFile.writeAsBytes(await pdfDocument.save());

    await NotificationHelper.showNotification(
      onNotificationTap: () {
        OpenFile.open(pdfFile.path);
      },
      file: pdfFile,
      // ignore: use_build_context_synchronously
      title: buildContext.locale.notificationTitle,
      // ignore: use_build_context_synchronously
      body: buildContext.locale.notificationBody,
    );
  }

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
}
