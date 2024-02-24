import 'package:common/avtovas_common.dart';
import 'package:common/src/widgets/authorization/utils/country_codes.dart';
import 'package:common/src/widgets/input_field/utils/country_phone_hints.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

final class PhoneInputField extends StatefulWidget {
  final ValueChanged<String> onPhoneChanged;

  const PhoneInputField({
    required this.onPhoneChanged,
    super.key,
  });

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  var _phoneValue = '';

  CountryCode? _countryCode;

  @override
  Widget build(BuildContext context) {
    return InputField(
      onChanged: (value) {
        setState(() => _phoneValue = value);
        widget.onPhoneChanged('${_countryCode!.dialCode}$_phoneValue');
      },
      keyboardType: TextInputType.phone,
      maxLines: 1,
      inputDecoration: InputDecoration(
        prefixIcon: CountryCodePicker(
          countryList: countryCodes,
          textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: CommonFonts.weightRegular,
          ),
          searchDecoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: context.locale.search,
            contentPadding: const EdgeInsets.all(CommonDimensions.medium),
          ),
          initialSelection: context.locale.localeName,
          onInit: (code) => Future.delayed(
            Duration.zero,
            () => setState(() => _countryCode = code),
          ),
          onChanged: (code) {
            setState(() => _countryCode = code);
            widget.onPhoneChanged('${_countryCode!.dialCode}$_phoneValue');
          },
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: CommonDimensions.medium,
          horizontal: CommonDimensions.large,
        ),
        hintText: _countryCode?.phoneHint(),
        enabledBorder: const OutlineInputBorder(),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
