import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class AvtovasAlertDialog extends StatelessWidget {
  final String? title;
  final TextStyle? titleTextStyle;
  final VoidCallback? okayCallback;
  final Widget? widget;
  final List<Widget>? actions;
  final bool withCancel;
  final bool shouldCloseOnOkTap;

  const AvtovasAlertDialog({
    this.title,
    this.titleTextStyle,
    this.okayCallback,
    this.widget,
    this.actions,
    this.withCancel = true,
    this.shouldCloseOnOkTap = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.themeData.copyWith(
        colorScheme: ColorScheme.dark(
          primary: context.theme.containerBackgroundColor,
        ),
      ),
      child: AlertDialog(
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
              if (withCancel)
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
                onPressed: () {
                  okayCallback?.call();
                  if (shouldCloseOnOkTap) Navigator.pop(context);
                },
                child: Text(
                  context.locale.ok,
                  style: context.themeData.textTheme.headlineSmall?.copyWith(
                    color: context.theme.mainAppColor,
                  ),
                ),
              ),
            ],
      ),
    );
  }
}
