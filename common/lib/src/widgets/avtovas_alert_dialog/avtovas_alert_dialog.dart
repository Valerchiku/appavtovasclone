import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

class AvtovasAlertDialog extends StatelessWidget {
  final String? title;
  final TextStyle? titleTextStyle;
  final VoidCallback? okayCallback;
  final Widget? widget;
  final List<Widget>? actions;

  const AvtovasAlertDialog({
    this.title,
    this.titleTextStyle,
    this.okayCallback,
    this.widget,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null
          ? Text(
              title!,
              style: titleTextStyle ??
                  context.themeData.textTheme.headlineMedium?.copyWith(
                    fontWeight: CommonFonts.weightRegular,
                  ),
            )
          : null,
      content: widget,
      actions: actions ??
          [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                context.locale.cancel.toUpperCase(),
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.mainAppColor,
                ),
              ),
            ),
            TextButton(
              onPressed: okayCallback,
              child: Text(
                context.locale.ok,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  color: context.theme.mainAppColor,
                ),
              ),
            ),
          ],
    );
  }
}
