import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/mock_ticket.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

abstract final class PDFTemplates {
  static pw.Column paymentTemplate({
    required BuildContext context,
    required Font font,
    required Font boldFont,
  }) {
    // Constants
    const blackHex = '#000000';
    final titleStyle = pw.TextStyle(
      font: boldFont,
      fontWeight: FontWeight.bold,
    );
    final subtitleStyle = pw.TextStyle(
      font: font,
      fontSize: 10,
    );
    final infoTitleTextStyle = pw.TextStyle(
      font: boldFont,
      fontSize: 8,
    );
    final infoTextStyle = pw.TextStyle(
      font: font,
      fontSize: 6,
    );
    final infoBoldTextStyle = pw.TextStyle(
      font: boldFont,
      fontSize: 6,
    );
    // Helper function for creating Table
    pw.Table createTable(List<pw.TableRow> children) {
      return pw.Table(
        defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
        border: pw.TableBorder.all(
          color: PdfColor.fromHex(blackHex),
        ),
        children: children,
      );
    }

    // Helper function for creating a row with flexible cells
    pw.TableRow createFlexibleRow(List<String> cellTexts) {
      final totalLength = cellTexts.join().length;
      final flexValues =
          cellTexts.map((text) => text.length / totalLength).toList();

      return pw.TableRow(
        decoration: pw.BoxDecoration(
          border: pw.Border.all(color: PdfColor.fromHex('#FFFFFF')),
        ),
        children: List.generate(
          cellTexts.length,
          (index) {
            return pw.Flexible(
              flex: flexValues[index].toInt(),
              child: pw.Padding(
                padding: const pw.EdgeInsets.all(6),
                child: pw.Center(
                  child: pw.Text(
                    cellTexts[index],
                    style: subtitleStyle,
                  ),
                ),
              ),
            );
          },
        ),
      );
    }

    // Important text info section
    pw.Column importantInfoTexts() {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            context.locale.importantNote,
            style: infoTitleTextStyle,
          ),
          pw.Text(
            context.locale.printTicketNote,
            style: infoTextStyle,
          ),
          pw.Text(
            context.locale.selfPrintNote,
            style: infoTextStyle,
          ),
          pw.Text(
            context.locale.boardingRequirementsNote,
            style: infoTextStyle,
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            context.locale.ticketRefundNote,
            style: infoTitleTextStyle,
          ),
          pw.Text(
            context.locale.ticketRefundInfo,
            style: infoBoldTextStyle,
          ),
          pw.Text(
            context.locale.ticketRefundBeforeDepartureNote,
            style: infoTextStyle,
          ),
          pw.Text(
            context.locale.ticketRefundAfterDepartureNote,
            style: infoTextStyle,
          ),
          pw.Text(
            context.locale.localDepartureTimeNote,
            style: infoTextStyle,
          ),
          pw.Text(
            context.locale.baggagePaymentNote,
            style: infoBoldTextStyle,
          ),
          pw.Text(
            context.locale.transportationAgreementNote,
            style: infoTextStyle,
          ),
          pw.Text(
            context.locale.thankYouNote,
            style: infoTextStyle,
          ),
        ],
      );
    }

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      mainAxisSize: pw.MainAxisSize.min,
      children: [
        pw.Text(
          context.locale.itineraryReceiptRu,
          style: titleStyle,
        ),
        pw.Text(
          context.locale.itineraryReceiptEn,
          style: titleStyle,
        ),
        pw.SizedBox(height: 10),
        createTable([
          createFlexibleRow([
            context.locale.purchaseDateTime,
            TicketMocks.ticketPDF.purchaseDateTime,
          ]),
          createFlexibleRow([
            context.locale.receiptID,
            TicketMocks.ticketPDF.receiptID,
          ]),
          createFlexibleRow([
            context.locale.ticketType,
            TicketMocks.ticketPDF.ticketType,
          ]),
        ]),
        pw.SizedBox(height: 10),
        pw.Text(
          context.locale.mobileApp,
          style: titleStyle,
        ),
        // ignore: lines_longer_than_80_chars
        pw.Text(
          '${context.locale.supportService}: ${context.locale.supportPhone} ${context.locale.supportHours}',
          style: subtitleStyle,
        ),
        pw.Text(
          context.locale.avtovasInfo,
          style: subtitleStyle,
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          context.locale.passengerFareInfo,
          style: titleStyle,
        ),
        pw.SizedBox(height: 10),
        createTable([
          createFlexibleRow([
            context.locale.passengerName,
            context.locale.passportNum,
            context.locale.fareAmount,
            context.locale.serviceFeeAmount,
            context.locale.totalAmount,
          ]),
          createFlexibleRow([
            TicketMocks.ticketPDF.passengerName,
            TicketMocks.ticketPDF.passportNum,
            TicketMocks.ticketPDF.fareAmount,
            TicketMocks.ticketPDF.serviceFeeAmount,
            TicketMocks.ticketPDF.totalAmount,
          ]),
        ]),
        pw.SizedBox(height: 10),
        pw.Text(
          context.locale.flightInfo,
          style: titleStyle,
        ),
        createTable([
          createFlexibleRow([
            context.locale.flightNumber,
            context.locale.departureStation,
            context.locale.departureDateTime,
            // ! This is the only way to display text normally
            '${context.locale.platform}                          ',
            '${context.locale.seat}                              ',
          ]),
          createFlexibleRow([
            TicketMocks.ticketPDF.flightNumber,
            TicketMocks.ticketPDF.departureStation,
            TicketMocks.ticketPDF.departureDateTime,
            TicketMocks.ticketPDF.platform,
            TicketMocks.ticketPDF.seat,
          ]),
        ]),
        pw.SizedBox(height: 10),
        createTable([
          createFlexibleRow([
            context.locale.arrivalStationArrival,
            context.locale.departureDateTime,
            '${context.locale.transportCompany}                                      ',
            context.locale.transportType,
          ]),
          createFlexibleRow([
            TicketMocks.ticketPDF.arrivalStationArrival,
            TicketMocks.ticketPDF.departureDateTime,
            '${TicketMocks.ticketPDF.transportCompany}                                         ',
            TicketMocks.ticketPDF.transportType,
          ]),
        ]),
        pw.SizedBox(height: 10),
        pw.Text(
          context.locale.paymentInfo,
          style: titleStyle,
        ),
        createTable([
          createFlexibleRow([
            context.locale.paid,
            TicketMocks.ticketPDF.paid,
            '',
            context.locale.contactInfo,
            '',
          ]),
          createFlexibleRow([
            context.locale.paymentMethod,
            context.locale.ePayment,
            '',
            context.locale.address,
            TicketMocks.ticketPDF.address,
          ]),
          createFlexibleRow([
            context.locale.totalPaymentAmount,
            TicketMocks.ticketPDF.totalPaymentAmount,
          ]),
        ]),
        pw.SizedBox(height: 10),
        pw.Divider(
          color: PdfColor.fromHex(blackHex),
        ),
        pw.SizedBox(height: 10),
        importantInfoTexts(),
      ],
    );
  }
}
