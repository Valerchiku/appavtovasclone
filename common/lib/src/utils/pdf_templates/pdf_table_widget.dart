import 'package:common/src/utils/mock_ticket.dart';
import 'package:common/src/utils/pdf_templates/pdf_text_widget.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

abstract final class PDFTableWidget {
  static pw.TableRow passengerTableRow({
    required String greenHex,
    required pw.TextStyle sizeTitleMedium,
    required MockTicketPassenger passenger,
  }) {
    return pw.TableRow(
      decoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: PdfColor.fromHex(greenHex),
          ),
        ),
      ),
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.all(4),
          child: PDFTextWidget.sizeTitleMediumText(
            text: passenger.fullName,
            sizeTitleMedium: sizeTitleMedium,
          ),
        ),
        PDFTextWidget.sizeTitleMediumText(
          text: passenger.documentNumber,
          sizeTitleMedium: sizeTitleMedium,
        ),
        PDFTextWidget.sizeTitleMediumText(
          text: passenger.fare,
          sizeTitleMedium: sizeTitleMedium,
        ),
        PDFTextWidget.sizeTitleMediumText(
          text: passenger.seat,
          sizeTitleMedium: sizeTitleMedium,
        ),
      ],
    );
  }

  static pw.Table passengerTable({
    required String greenHex,
    required pw.TextStyle sizeTitleMedium,
    required pw.TextStyle sizeTitleMediumWhite,
    required MockTicket mockTicket,
  }) {
    return pw.Table(
      defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
      children: [
        pw.TableRow(
          decoration: pw.BoxDecoration(
            color: PdfColor.fromHex(greenHex),
          ),
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: PDFTextWidget.sizeTitleMediumText(
                text: 'Ф.И.О.',
                sizeTitleMedium: sizeTitleMedium,
              ),
            ),
            PDFTextWidget.sizeTitleMediumText(
              text: 'Паспорт, серия/номер',
              sizeTitleMedium: sizeTitleMedium,
            ),
            PDFTextWidget.sizeTitleMediumText(
              text: 'Тариф',
              sizeTitleMedium: sizeTitleMedium,
            ),
            PDFTextWidget.sizeTitleMediumText(
              text: 'Место',
              sizeTitleMedium: sizeTitleMedium,
            ),
          ],
        ),
        for (final passenger in mockTicket.passengers)
          passengerTableRow(
            passenger: passenger,
            greenHex: greenHex,
            sizeTitleMedium: sizeTitleMedium,
          ),
      ],
    );
  }

  static pw.Column flightDetails({
    required String greenHex,
    required pw.TextStyle sizeTitleMedium,
    required pw.TextStyle sizeTitleMediumWhite,
    required MockTicket mockTicket,
  }) {
    return pw.Column(
      children: [
        pw.Table(
          defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
          children: [
            pw.TableRow(
              decoration: pw.BoxDecoration(
                color: PdfColor.fromHex(greenHex),
              ),
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(4),
                  child: PDFTextWidget.sizeTitleMediumWhiteText(
                    text: 'Рейс',
                    sizeTitleMedium: sizeTitleMedium,
                  ),
                ),
                PDFTextWidget.sizeTitleMediumWhiteText(
                  text: 'Транспорт',
                  sizeTitleMedium: sizeTitleMedium,
                ),
              ],
            ),
            pw.TableRow(
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  bottom: pw.BorderSide(
                    color: PdfColor.fromHex(greenHex),
                  ),
                ),
              ),
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(4),
                  
                  child: PDFTextWidget.sizeTitleMediumText(
                    text:
                    // ignore: lines_longer_than_80_chars
                        '${mockTicket.departureStation} - ${mockTicket.arrivalStation}',
                    sizeTitleMedium: sizeTitleMedium,
                  ),
                ),
                PDFTextWidget.sizeTitleMediumText(
                  text: mockTicket.transportType,
                  sizeTitleMedium: sizeTitleMedium,
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 5),
        pw.Table(
          defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
          children: [
            pw.TableRow(
              decoration: pw.BoxDecoration(
                color: PdfColor.fromHex(greenHex),
              ),
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(4),
                  child: PDFTextWidget.sizeTitleMediumWhiteText(
                    text: 'Отправление',
                    sizeTitleMedium: sizeTitleMedium,
                  ),
                ),
                PDFTextWidget.sizeTitleMediumWhiteText(
                  text: 'Транспорт',
                  sizeTitleMedium: sizeTitleMedium,
                ),
                PDFTextWidget.sizeTitleMediumWhiteText(
                  text: 'Прибытие',
                  sizeTitleMedium: sizeTitleMedium,
                ),
                PDFTextWidget.sizeTitleMediumWhiteText(
                  text: 'Платформа',
                  sizeTitleMedium: sizeTitleMedium,
                ),
                PDFTextWidget.sizeTitleMediumWhiteText(
                  text: 'Автопредприятие',
                  sizeTitleMedium: sizeTitleMedium,
                ),
              ],
            ),
            pw.TableRow(
              verticalAlignment: pw.TableCellVerticalAlignment.middle,
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(4),
                  child: PDFTextWidget.sizeTitleMediumText(
                    text: mockTicket.departureStation,
                    sizeTitleMedium: sizeTitleMedium,
                  ),
                ),
                PDFTextWidget.sizeTitleMediumText(
                  text: mockTicket.arrivalStation,
                  sizeTitleMedium: sizeTitleMedium,
                ),
                PDFTextWidget.sizeTitleMediumText(
                  text: mockTicket.platform,
                  sizeTitleMedium: sizeTitleMedium,
                ),
                PDFTextWidget.sizeTitleMediumText(
                  text: mockTicket.carrier,
                  sizeTitleMedium: sizeTitleMedium,
                ),
              ],
            ),
            pw.TableRow(
              decoration: pw.BoxDecoration(
                border: pw.Border(
                  bottom: pw.BorderSide(
                    color: PdfColor.fromHex(greenHex),
                  ),
                ),
              ),
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(4),
                  child: PDFTextWidget.sizeTitleMediumText(
                    text: mockTicket.departureDateTime,
                    sizeTitleMedium: sizeTitleMedium,
                  ),
                ),
                PDFTextWidget.sizeTitleMediumText(
                  text: mockTicket.arrivalDateTime,
                  sizeTitleMedium: sizeTitleMedium,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  static pw.Table priceDetails({
    required String greenHex,
    required pw.TextStyle sizeTitleMedium,
    required pw.TextStyle sizeTitleMediumWhite,
    required bool isReturnTicket,
    required MockTicket mockTicket,
  }) {
    return pw.Table(
      defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
      children: [
        pw.TableRow(
          decoration: pw.BoxDecoration(
            color: PdfColor.fromHex(greenHex),
          ),
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: PDFTextWidget.sizeTitleMediumWhiteText(
                text: 'Стоимость билета (руб)',
                sizeTitleMedium: sizeTitleMedium,
              ),
            ),
            PDFTextWidget.sizeTitleMediumWhiteText(
              text: isReturnTicket == true
                  ? 'Сервисный сбор (руб)'
                  : 'Удержано (руб)',
              sizeTitleMedium: sizeTitleMedium,
            ),
            PDFTextWidget.sizeTitleMediumWhiteText(
              text: isReturnTicket == true
                  ? 'Итого оплачено (руб)'
                  : 'Возврат (руб)',
              sizeTitleMedium: sizeTitleMedium,
            ),
          ],
        ),
        pw.TableRow(
          decoration: pw.BoxDecoration(
            border: pw.Border(
              bottom: pw.BorderSide(
                color: PdfColor.fromHex(greenHex),
              ),
            ),
          ),
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(4),
              child: PDFTextWidget.sizeTitleMediumText(
                text: mockTicket.ticketPrice,
                sizeTitleMedium: sizeTitleMedium,
              ),
            ),
            PDFTextWidget.sizeTitleMediumText(
              text: '0',
              sizeTitleMedium: sizeTitleMedium,
            ),
            PDFTextWidget.sizeTitleMediumText(
              text: mockTicket.ticketPrice,
              sizeTitleMedium: sizeTitleMedium,
            ),
          ],
        ),
      ],
    );
  }
}
