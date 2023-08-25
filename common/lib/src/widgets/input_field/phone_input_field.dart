import 'package:common/src/localization/localizations_ext.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/widgets/input_field/input_field.dart';
import 'package:flutter/material.dart';

final class PhoneInputField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final ValueChanged<String> onPhoneChanged;

  const PhoneInputField({
    required this.onPhoneChanged,
    required this.formKey,
    super.key,
  });

  String? _validator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.locale.authorizationErrorMessage;
    }

    final cleanedPhoneNumber = value.replaceAll(RegExp(r'\D'), '');

    final isNumberValid =
        RegExp(r'(^8|7|\+7)((\d{10})|(\s\(\d{3}\)\s\d{3}\s\d{2}\s\d{2}))')
            .hasMatch(cleanedPhoneNumber);

    return isNumberValid ? null : context.locale.authorizationErrorMessage;
  }

  @override
  Widget build(BuildContext context) {
    return InputField(
      onChanged: onPhoneChanged,
      formKey: formKey,
      keyboardType: TextInputType.phone,
      validator: (value) => _validator(context, value),
      inputDecoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: CommonDimensions.medium,
          horizontal: CommonDimensions.large,
        ),
        hintText: '+7 (999) 123-45-67',
        enabledBorder: OutlineInputBorder(),
        border: OutlineInputBorder(),
      ),
    );
  }
}
