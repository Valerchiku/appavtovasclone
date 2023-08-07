import 'package:common/avtovas_common.dart';
import 'package:common/src/widgets/input_field/phone_input_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

final class AuthorizationPhoneContainer extends StatefulWidget {
  final ValueChanged<String> onNumberChanged;
  final VoidCallback onSendButtonTap;
  final VoidCallback onTextTap;
  final String number;

  const AuthorizationPhoneContainer({
    required this.onNumberChanged,
    required this.onSendButtonTap,
    required this.onTextTap,
    required this.number,
    super.key,
  });

  @override
  State<AuthorizationPhoneContainer> createState() =>
      _AuthorizationPhoneContainerState();
}

class _AuthorizationPhoneContainerState
    extends State<AuthorizationPhoneContainer> {
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();
  }

  void _validate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.reset();
      _showDialog();
    }
  }

  Future<void> _showDialog() async {
    await showDialog(
      context: context,
      builder: (_) {
        return AvtovasAlertDialog(
          title: context.locale.authorizationWarning(widget.number),
          okayCallback: widget.onSendButtonTap,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: CommonDimensions.extraLarge,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.locale.authorizationTitle,
            style: context.themeData.textTheme.headlineLarge?.copyWith(
              fontSize: CommonFonts.sizeDisplayMedium,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: CommonDimensions.large),
          Text(
            context.locale.authorizationSubtitle,
            style: context.themeData.textTheme.bodyLarge?.copyWith(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: CommonDimensions.extraLarge),
          PhoneInputField(
            onPhoneChanged: (value) {},
            formKey: _formKey,
          ),
          const SizedBox(height: CommonDimensions.large),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: context.locale.authorizationFirstSuggestion,
                  style: context.themeData.textTheme.titleLarge,
                ),
                TextSpan(
                  text: context.locale.authorizationLastSuggestion,
                  style: context.themeData.textTheme.titleLarge?.copyWith(
                    color: context.theme.mainAppColor,
                    decoration: TextDecoration.underline,
                    decorationColor: context.theme.mainAppColor,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = widget.onTextTap,
                ),
              ],
            ),
          ),
          const SizedBox(height: CommonDimensions.extraLarge),
          AvtovasButton.text(
            buttonText: context.locale.authorizationSendSms,
            onTap: _validate,
            padding: const EdgeInsets.all(CommonDimensions.large),
          ),
        ],
      ),
    );
  }
}
