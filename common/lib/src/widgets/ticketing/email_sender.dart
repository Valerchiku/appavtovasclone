import 'package:common/src/localization/localizations_ext.dart';
import 'package:common/src/theme/theme_extension.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/list_extension.dart';
import 'package:common/src/widgets/input_field/input_field.dart';
import 'package:common/src/widgets/passenger/ticketing_container.dart';
import 'package:common/src/widgets/utils_widgets/avtovas_checkbox.dart';
import 'package:flutter/material.dart';

final class EmailSender extends StatelessWidget {
  final TextEditingController? controller;
  final GlobalKey<FormState>? formKey;
  final ValueChanged<String> onChanged;
  final ValueChanged<bool>? onSavedEmailChanged;
  final bool isSavedEmailUsed;
  final String? savedEmail;

  const EmailSender({
    required this.onChanged,
    this.onSavedEmailChanged,
    this.isSavedEmailUsed = false,
    this.savedEmail,
    this.controller,
    this.formKey,
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
            maxLines: 1,
            formKey: formKey,
            controller: controller,
            hintText: context.locale.emailExample,
            onChanged: onChanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Поле должно быть заполнено!';
              }

              return null;
            },
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
