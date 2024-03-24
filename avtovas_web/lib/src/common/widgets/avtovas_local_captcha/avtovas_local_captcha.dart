import 'dart:math';

import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:avtovas_web/src/common/widgets/avtovas_local_captcha/captcha_backgrounds.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

final class AvtovasLocalCaptcha extends StatefulWidget {
  final VoidCallback onCaptchaPassed;
  final VoidCallback onAttemptFailed;

  const AvtovasLocalCaptcha({
    required this.onCaptchaPassed,
    required this.onAttemptFailed,
    super.key,
  });

  @override
  State<AvtovasLocalCaptcha> createState() => _AvtovasLocalCaptchaState();
}

class _AvtovasLocalCaptchaState extends State<AvtovasLocalCaptcha> {
  late final TextEditingController _captchaController;

  var _attemptQuantity = 0;
  var _errorAttempt = false;

  var _enteredSequence = '';

  var _backgroundPath = '';
  var _generatedSequence = '';

  final List<double> _rotationList = [];

  @override
  void initState() {
    super.initState();

    _captchaController = TextEditingController();

    _generateBackgroundPath();
  }

  void _generateBackgroundPath() {
    setState(_rotationList.clear);

    final randomCode = Random().nextInt(999999) + 100000;
    final randomIndex = Random().nextInt(4) + 1;

    for (var i = 0; i < 6; i++) {
      final randomRotation = Random().nextDouble() * 1;

      setState(
        () => _rotationList.add(
          randomRotation * (Random().nextBool() ? -1 : 1),
        ),
      );
    }

    setState(
      () {
        _generatedSequence = randomCode.toString();
        _backgroundPath = CaptchaBackgrounds.captchaBackgrounds[randomIndex];
      },
    );
  }

  void _checkAttempt() {
    _captchaController.clear();

    if (_attemptQuantity == 4) {
      widget.onAttemptFailed();
      return;
    }

    if (_enteredSequence == _generatedSequence) {
      widget.onCaptchaPassed();
    } else {
      _attemptQuantity++;

      setState(() => _errorAttempt = true);
      _generateBackgroundPath();
    }
  }

  @override
  void dispose() {
    _captchaController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_backgroundPath),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.extraLarge,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var i = 0; i < _rotationList.length; i++)
                    Transform.rotate(
                      angle: _rotationList[i],
                      child: Text(
                        _generatedSequence.characters
                            .characterAt(i)
                            .toString(),
                        style: GoogleFonts.alkalami().copyWith(
                          fontSize: 36,
                          color: context.theme.whiteTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          AnimatedSizedBox(
            toHeight: _attemptQuantity != 0 ? null : AppDimensions.none,
            child: Column(
              children: [
                const SizedBox(height: AppDimensions.medium),
                Text('Осталось попыток: ${5 - _attemptQuantity}'),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.extraLarge),
          CupertinoTextField(
            controller: _captchaController,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(AppDimensions.medium),
              ),
              border: Border.fromBorderSide(
                BorderSide(
                  color: _errorAttempt
                      ? context.theme.errorColor
                      : context.theme.fivefoldTextColor,
                ),
              ),
            ),
            placeholder: 'Введите 6-значное значение',
            placeholderStyle: context.themeData.textTheme.bodyLarge?.copyWith(
              color: context.theme.fivefoldTextColor,
              fontSize: WebFonts.sizeTitleMedium,
            ),
            onChanged: (value) {
              setState(() => _errorAttempt = false);
              _enteredSequence = value;
            },
          ),
          const SizedBox(height: AppDimensions.medium),
          Row(
            children: [
              Expanded(
                child: AvtovasButton.text(
                  buttonColor: context.theme.transparent,
                  backgroundOpacity: 0,
                  borderColor: context.theme.mainAppColor,
                  textStyle: context.themeData.textTheme.bodyLarge,
                  buttonText: context.locale.cancel,
                  onTap: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: AppDimensions.mediumLarge),
              Expanded(
                child: AvtovasButton.text(
                  buttonText: context.locale.ok,
                  onTap: _checkAttempt,
                  isActive: _captchaController.text.isNotEmpty,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
