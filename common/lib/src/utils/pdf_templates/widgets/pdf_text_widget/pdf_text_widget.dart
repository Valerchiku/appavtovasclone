import 'package:pdf/widgets.dart' as pw;

abstract final class PDFTextWidget {
  static pw.Text sizeHeadlineMediumText({
    required String text,
    required pw.TextStyle sizeHeadlineMedium,
  }) {
    return pw.Text(
      text,
      style: sizeHeadlineMedium,
    );
  }

  static pw.Text sizeHeadlineSmallText({
    required String text,
    required pw.TextStyle sizeHeadlineSmall,
  }) {
    return pw.Text(
      text,
      style: sizeHeadlineSmall,
    );
  }

  static pw.Text sizeTitleMediumText({
    required String text,
    required pw.TextStyle sizeTitleMedium,
  }) {
    return pw.Text(
      text,
      style: sizeTitleMedium,
    );
  }

  static pw.Text sizeTitleMediumWhiteText({
    required String text,
    required pw.TextStyle sizeTitleMedium,
  }) {
    return pw.Text(
      text,
      style: sizeTitleMedium,
    );
  }

  static pw.Text sizeFontSmallText({
    required String text,
    required pw.TextStyle sizeFontSmall,
  }) {
    return pw.Text(
      text,
      style: sizeFontSmall,
    );
  }
}
