import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/pdf_templates/widgets/pdf_text_widget/pdf_text_widget.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

abstract final class PDFTableWidget {
  static pw.TableRow passengerTableRow({
    required String greenHex,
    required pw.TextStyle sizeTitleMedium,
    required Passenger passenger,
    required String seat,
  }) {
    String getUserFullName(
      String firstName,
      String lastName,
      String? surname,
    ) {
      if (surname == null || surname == '') {
        return '$firstName $lastName';
      }
      return '$firstName $lastName $surname';
    }

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
            text: getUserFullName(
              passenger.firstName,
              passenger.lastName,
              passenger.surname,
            ),
            sizeTitleMedium: sizeTitleMedium,
          ),
        ),
        PDFTextWidget.sizeTitleMediumText(
          text: 'Пассажирский',
          sizeTitleMedium: sizeTitleMedium,
        ),
        PDFTextWidget.sizeTitleMediumText(
          text: passenger.citizenship,
          sizeTitleMedium: sizeTitleMedium,
        ),
        PDFTextWidget.sizeTitleMediumText(
          text: seat,
          sizeTitleMedium: sizeTitleMedium,
        ),
      ],
    );
  }

  static pw.Table passengerTable({
    required String greenHex,
    required pw.TextStyle sizeTitleMedium,
    required pw.TextStyle sizeTitleMediumWhite,
    required List<Passenger> passengers,
    required List<String> seats,
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
              text: 'Тариф',
              sizeTitleMedium: sizeTitleMedium,
            ),
            PDFTextWidget.sizeTitleMediumText(
              text: 'Гражданство',
              sizeTitleMedium: sizeTitleMedium,
            ),
            PDFTextWidget.sizeTitleMediumText(
              text: 'Место',
              sizeTitleMedium: sizeTitleMedium,
            ),
          ],
        ),
        for (var i = 0; i < passengers.length; i++)
          passengerTableRow(
            passenger: passengers[i],
            seat: seats[i],
            greenHex: greenHex,
            sizeTitleMedium: sizeTitleMedium,
          ),
      ],
    );
  }

  static pw.Column flightDetails({
    required SingleTrip singleTrip,
    required String greenHex,
    required pw.TextStyle sizeTitleMedium,
    required pw.TextStyle sizeTitleMediumWhite,
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
                        '${singleTrip.departure.name} - ${singleTrip.destination.name}',
                    sizeTitleMedium: sizeTitleMedium,
                  ),
                ),
                PDFTextWidget.sizeTitleMediumText(
                  text:
                      '${singleTrip.bus.model} ${singleTrip.bus.licencePlate}',
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
                    text: singleTrip.departure.name,
                    sizeTitleMedium: sizeTitleMedium,
                  ),
                ),
                PDFTextWidget.sizeTitleMediumText(
                  text: singleTrip.destination.name,
                  sizeTitleMedium: sizeTitleMedium,
                ),
                PDFTextWidget.sizeTitleMediumText(
                  text: singleTrip.platform,
                  sizeTitleMedium: sizeTitleMedium,
                ),
                PDFTextWidget.sizeTitleMediumText(
                  text: singleTrip.carrier,
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
                    text: singleTrip.departureTime.ticketDateFormat(),
                    sizeTitleMedium: sizeTitleMedium,
                  ),
                ),
                PDFTextWidget.sizeTitleMediumText(
                  text: singleTrip.arrivalTime.ticketDateFormat(),
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
    required BuildContext context,
    required SingleTrip singleTrip,
    required int passengerCount,
    required String greenHex,
    required pw.TextStyle sizeTitleMedium,
    required pw.TextStyle sizeTitleMediumWhite,
    required bool isReturnTicket,
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
                text: context.locale.price(singleTrip.passengerFareCost),
                sizeTitleMedium: sizeTitleMedium,
              ),
            ),
            PDFTextWidget.sizeTitleMediumText(
              text: '0',
              sizeTitleMedium: sizeTitleMedium,
            ),
            PDFTextWidget.sizeTitleMediumText(
              text: context.locale
                  .price(singleTrip.passengerFareCost * passengerCount),
              sizeTitleMedium: sizeTitleMedium,
            ),
          ],
        ),
      ],
    );
  }
}
