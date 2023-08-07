import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_utils.dart';
import 'package:common/avtovas_common_widgets.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/widgets/ticketing/ticketing_container.dart';
import 'package:common/src/widgets/utils_widgets/avtovas_checkbox.dart';
import 'package:flutter/material.dart';

final class EmailSender extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<bool>? onSavedEmailChanged;
  final bool isSavedEmailUsed;
  final String? savedEmail;

  const EmailSender({
    required this.onChanged,
    this.onSavedEmailChanged,
    this.isSavedEmailUsed = true,
    this.savedEmail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TicketingContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            context.locale.emailSenderTitle,
            style: context.themeData.textTheme.titleLarge,
          ),
          const SizedBox(height: CommonDimensions.medium),
          InputField(
            hintText: context.locale.emailExample,
            onChanged: onChanged,
          ),
          if (savedEmail != null) ...[
            const SizedBox(height: CommonDimensions.medium),
            AvtovasCheckbox(
              onChanged: (value) {
                if (value != null) onSavedEmailChanged?.call(value);
              },
              value: isSavedEmailUsed,
              checkboxText: context.locale.useThat(savedEmail!),
            ),
          ],
        ].insertBetween(
          const SizedBox(height: CommonDimensions.medium),
        ),
      ),
    );
  }
}
