import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/widgets/input_field/input_field.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

final class PhoneInputField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final ValueChanged<String> onPhoneChanged;

  const PhoneInputField({
    required this.onPhoneChanged,
    required this.formKey,
    super.key,
  });

  String? _validator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return 'Некорректное значение';

    final cleanedPhoneNumber = value.replaceAll(RegExp(r'\D'), '');

    final isNumberValid =
        RegExp(r'(^8|7|\+7)((\d{10})|(\s\(\d{3}\)\s\d{3}\s\d{2}\s\d{2}))')
            .hasMatch(cleanedPhoneNumber);

    return isNumberValid ? null : 'Некорректное значение';
  }

  @override
  Widget build(BuildContext context) {
    return InputField(
      formKey: formKey,
      keyboardType: TextInputType.phone,
      validator: (value) => _validator(context, value),
      decoration: InputDecoration(
        hintText: '+7 (999) 123-45-67',
        contentPadding: const EdgeInsets.all(CommonDimensions.large),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: context.theme.assistiveTextColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.theme.assistiveTextColor),
        ),
      ),
    );
  }
}
