import 'dart:async';

import 'package:common/src/localization/localizations_ext.dart';
import 'package:common/src/theme/theme_extension.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:common/src/widgets/authorization/code_authenticator.dart';
import 'package:common/src/widgets/avtovas_buttons/avtovas_button.dart';
import 'package:common/src/widgets/utils_widgets/animated_sized_box.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

final class AuthorizationCodeContainer extends StatefulWidget {
  final ValueChanged<String> onCodeEntered;
  final VoidCallback onResendButtonTap;
  final VoidCallback onTextTap;
  final String number;

  const AuthorizationCodeContainer({
    required this.onCodeEntered,
    required this.onResendButtonTap,
    required this.onTextTap,
    required this.number,
    super.key,
  });

  @override
  State<AuthorizationCodeContainer> createState() =>
      _AuthorizationCodeContainerState();
}

class _AuthorizationCodeContainerState
    extends State<AuthorizationCodeContainer> {
  static const _secondsAmount = 60;

  late Timer _timer;

  late int _currentSeconds;
  var _isResendButtonActive = false;

  @override
  void initState() {
    super.initState();

    // ignore: avoid-unnecessary-setState
    _restartTimer();
  }

  void _restartTimer() {
    setState(() {
      _isResendButtonActive = false;
      _currentSeconds = _secondsAmount;
    });

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() => _currentSeconds = _currentSeconds - 1);
        if (_currentSeconds == 0) {
          _timer.cancel();
          setState(() => _isResendButtonActive = true);
        }
      },
    );
  }

  void _onResendTap() {
    _restartTimer();
    widget.onResendButtonTap();
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
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
            context.locale.authorizationSubtitleWithNumber(
              widget.number,
            ),
            style: context.themeData.textTheme.bodyLarge?.copyWith(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: CommonDimensions.extraLarge),
          CodeAuthenticator(onCodeEntered: widget.onCodeEntered),
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
            isActive: _isResendButtonActive,
            buttonText: context.locale.authorizationSendSms,
            onTap: _onResendTap,
            padding: const EdgeInsets.all(CommonDimensions.large),
          ),
          const SizedBox(height: CommonDimensions.large),
          AnimatedSizedBox(
            toHeight: _currentSeconds == 0 ? CommonDimensions.none : null,
            child: Text(
              context.locale.authorizationWaitMessage(_currentSeconds),
              style: context.themeData.textTheme.titleLarge?.copyWith(
                color: context.theme.primaryTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
