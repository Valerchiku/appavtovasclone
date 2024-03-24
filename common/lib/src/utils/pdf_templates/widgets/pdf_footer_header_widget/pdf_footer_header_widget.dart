// ignore_for_file: lines_longer_than_80_chars

import 'package:common/src/utils/pdf_templates/widgets/pdf_text_widget/pdf_text_widget.dart';
import 'package:pdf/widgets.dart' as pw;

abstract final class PDFFooterHeaderWidget {
  static pw.Column ticketHeader({
    required pw.TextStyle sizeHeadlineMedium,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        PDFTextWidget.sizeHeadlineMediumText(
          text: 'Маршрутная квитанция электронного билета',
          sizeHeadlineMedium: sizeHeadlineMedium,
        ),
        PDFTextWidget.sizeHeadlineMediumText(
          text: 'E-Ticket itinerary receipt',
          sizeHeadlineMedium: sizeHeadlineMedium,
        ),
        PDFTextWidget.sizeHeadlineMediumText(
          text: 'АО «Автовас» (ИНН 2126000549).',
          sizeHeadlineMedium: sizeHeadlineMedium,
        ),
      ],
    );
  }

  static pw.Column returnHeader({
    required pw.TextStyle sizeHeadlineMedium,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        PDFTextWidget.sizeHeadlineMediumText(
          text: 'Квитанция возврата электронного билета',
          sizeHeadlineMedium: sizeHeadlineMedium,
        ),
        PDFTextWidget.sizeHeadlineMediumText(
          text: 'E-Ticket return itinerary receipt',
          sizeHeadlineMedium: sizeHeadlineMedium,
        ),
        PDFTextWidget.sizeHeadlineMediumText(
          text: 'АО «Автовас» (ИНН 2126000549).',
          sizeHeadlineMedium: sizeHeadlineMedium,
        ),
      ],
    );
  }

  static pw.Row header({
    required pw.Widget image,
    required pw.TextStyle sizeHeadlineMedium,
    required bool isReturnTicket,
  }) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Container(
          height: 100,
          width: 100,
          child: image,
        ),
        if (isReturnTicket == true)
          returnHeader(
            sizeHeadlineMedium: sizeHeadlineMedium,
          ),
        if (isReturnTicket != true)
          ticketHeader(
            sizeHeadlineMedium: sizeHeadlineMedium,
          ),
      ],
    );
  }

  static pw.Row mainTicketDetails({
    required String paymentId,
    required String routeId,
    required String purchaseDate,
    required pw.TextStyle sizeHeadlineSmall,
    required pw.TextStyle sizeTitleMedium,
    required bool isReturnTicket,
  }) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            PDFTextWidget.sizeHeadlineSmallText(
              text: 'Идентификатор квитанции',
              sizeHeadlineSmall: sizeHeadlineSmall,
            ),
            PDFTextWidget.sizeTitleMediumText(
              text: paymentId,
              sizeTitleMedium: sizeTitleMedium,
            ),
          ],
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            PDFTextWidget.sizeHeadlineSmallText(
              text: 'Номер рейса',
              sizeHeadlineSmall: sizeHeadlineSmall,
            ),
            PDFTextWidget.sizeTitleMediumText(
              text: routeId,
              sizeTitleMedium: sizeTitleMedium,
            ),
          ],
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            PDFTextWidget.sizeHeadlineSmallText(
              text: isReturnTicket == true
                  ? 'Дата и время возврата'
                  : 'Дата и время покупки',
              sizeHeadlineSmall: sizeHeadlineSmall,
            ),
            PDFTextWidget.sizeTitleMediumText(
              text: purchaseDate,
              sizeTitleMedium: sizeTitleMedium,
            ),
          ],
        ),
      ],
    );
  }

  /// Just info
  static pw.Column specialNote({
    required pw.TextStyle sizeHeadlineSmall,
    required pw.TextStyle sizeFontSmall,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        PDFTextWidget.sizeHeadlineSmallText(
          text: 'Важно!',
          sizeHeadlineSmall: sizeHeadlineSmall,
        ),
        PDFTextWidget.sizeFontSmallText(
          text:
              'Для посадки на рейсы в Центральном автовокзале г. Чебоксары (адрес: проспект Мира, 78) не нужно распечатывать посадочный билет. Пожалуйста, обратите внимание, что в автовокзале нет доступа к услуге печати билетов. Посадка на рейс осуществляется при предъявлении оригиналов документов, удостоверяющих личность, всех путешественников. Для детей также требуется предъявление свидетельства о рождении.',
          sizeFontSmall: sizeFontSmall,
        ),
        PDFTextWidget.sizeHeadlineSmallText(
          text: 'Возврат билетов',
          sizeHeadlineSmall: sizeHeadlineSmall,
        ),
        PDFTextWidget.sizeFontSmallText(
          text:
              'Возврат билета возможен исключительно через сайт или мобильное приложение. Кассовый возврат не предусмотрен.',
          sizeFontSmall: sizeFontSmall,
        ),
        PDFTextWidget.sizeFontSmallText(
          text:
              'Для возврата перед отправлением рейса требуется сделать это за 20 минут до непосредственной отправки. После отправления рейса возврат возможен в течение 3 часов, но не ранее, чем через 20 минут после отправления.',
          sizeFontSmall: sizeFontSmall,
        ),
        PDFTextWidget.sizeFontSmallText(
          text:
              'Время отправления указано местное. Рекомендуется минимальный интервал пересадки между прибытием и отправлением стыковочных рейсов не менее 1 часа.',
          sizeFontSmall: sizeFontSmall,
        ),
        PDFTextWidget.sizeFontSmallText(
          text: 'Оплата багажа осуществляется на автовокзале.',
          sizeFontSmall: sizeFontSmall,
        ),
        PDFTextWidget.sizeFontSmallText(
          text:
              'Договор перевозки считается заключенным и вступившим в силу с момента покупки билета. Эта квитанция подтверждает факт покупки указанного в ней билета на указанный рейс.',
          sizeFontSmall: sizeFontSmall,
        ),
        PDFTextWidget.sizeFontSmallText(
          text: 'Благодарим вас за покупку электронного билета!',
          sizeFontSmall: sizeFontSmall,
        ),
      ],
    );
  }

  static pw.Row supportEmails({
    required pw.TextStyle sizeFontSmall,
  }) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        PDFTextWidget.sizeFontSmallText(
          text: 'Тех. поддержка: it@avtovas.com',
          sizeFontSmall: sizeFontSmall,
        ),
        PDFTextWidget.sizeFontSmallText(
          text: 'Приемная для обращений: mail@avtovas.com',
          sizeFontSmall: sizeFontSmall,
        ),
      ],
    );
  }
}
