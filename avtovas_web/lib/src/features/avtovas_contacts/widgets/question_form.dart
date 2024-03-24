import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:avtovas_web/src/common/navigation/app_router.dart';
import 'package:avtovas_web/src/common/navigation/configurations.dart';
import 'package:avtovas_web/src/common/widgets/avtovas_local_captcha/avtovas_local_captcha.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:common/avtovas_utils_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class QuestionForm extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController questionController;
  final VoidCallback onQuestionSendTap;

  const QuestionForm({
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.questionController,
    required this.onQuestionSendTap,
    super.key,
  });

  @override
  State<QuestionForm> createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final StreamSubscription<html.PopStateEvent> _popSubscription;

  late final List<GlobalKey<FormState>> _formKeys;

  var _acceptDialogWasOpened = false;

  @override
  void initState() {
    super.initState();

    _formKeys = List.generate(4, (index) => GlobalKey<FormState>());

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..addListener(() => setState(() {}));

    _popSubscription = html.window.onPopState.listen(
      (event) {
        if (_acceptDialogWasOpened) {}
      },
    );
  }

  Future<void> _showFlushBar(BuildContext context) {
    return Flushbar(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimensions.large),
      ),
      backgroundColor: context.theme.whiteTextColor,
      titleText: Text(
        'Обращение создано',
        style: context.themeData.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: WebFonts.appBarFontSize,
        ),
      ),
      isDismissible: false,
      duration: const Duration(seconds: 7),
      animationDuration: const Duration(milliseconds: 150),
      messageText: Text(
        'Спасибо за то, что помогаете сделать систему лучше. '
        'В скором будущем с Вами свяжутся.',
        style: context.themeData.textTheme.bodyLarge?.copyWith(
          fontSize: WebFonts.sizeHeadlineMedium,
        ),
      ),
    ).show(context);
  }

  Future<void> _showAcceptSendQuestionDialog(BuildContext context) {
    _acceptDialogWasOpened = true;

    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (context) {
        return AvtovasAlertDialog(
          title: 'Создать обращение в техподдержку?',
          okayCallback: () {
            widget.onQuestionSendTap();
            _showFlushBar(context);
            _clearControllers();
          },
        );
      },
    ).whenComplete(() => _acceptDialogWasOpened = false);
  }

  Future<void> _showCaptchaDialog(BuildContext context) {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (context) {
        return AvtovasLocalCaptcha(
          onCaptchaPassed: () {
            Navigator.pop(context);
            _showAcceptSendQuestionDialog(context);
          },
          onAttemptFailed: () {
            Navigator.pop(context);
            _animationController
              ..reset()
              ..forward();
          },
        );
      },
    );
  }

  String? _emptyFormValidator(String? value) {
    return value == null || value.isEmpty ? 'Поле должно быть заполнено' : null;
  }

  bool _validateFields() {
    final validates = <bool>[];

    for (final formKey in _formKeys) {
      validates.add(formKey.currentState!.validate());
    }

    return !validates.contains(false);
  }

  void _sendQuestion(BuildContext context) {
    if (!_validateFields()) return;

    _showCaptchaDialog(context);
  }

  void _clearControllers() {
    widget.nameController.clear();
    widget.emailController.clear();
    widget.phoneController.clear();
    widget.questionController.clear();

    for (final formKey in _formKeys) {
      formKey.currentState!.reset();
    }
  }

  @override
  void dispose() {
    _popSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themePath = context.themeData.textTheme;

    return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      decoration: BoxDecoration(
        color: colorPath.whiteTextColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.medium),
        ),
      ),
      child: Column(
        children: <Widget>[
          InputField(
            formKey: _formKeys[0],
            validator: _emptyFormValidator,
            hintText: context.locale.enterName,
            controller: widget.nameController,
          ),
          const SizedBox(height: AppDimensions.large),
          InputField(
            formKey: _formKeys[1],
            validator: _emptyFormValidator,
            hintText: context.locale.emailExample,
            controller: widget.emailController,
          ),
          const SizedBox(height: AppDimensions.large),
          InputField(
            formKey: _formKeys[2],
            validator: _emptyFormValidator,
            hintText: context.locale.enterPhoneNumber,
            controller: widget.phoneController,
          ),
          const SizedBox(height: AppDimensions.large),
          InputField(
            formKey: _formKeys[3],
            validator: _emptyFormValidator,
            hintText: context.locale.enterQuestion,
            controller: widget.questionController,
            minLines: 7,
            maxLines: 8,
          ),
          const SizedBox(height: AppDimensions.large),
          AvtovasButton.text(
            buttonText: context.locale.askQuestion,
            isActive: !_animationController.isAnimating,
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.large,
            ),
            onTap: () => _sendQuestion(context),
          ),
          AnimatedSizedBox(
            toHeight: _animationController.isAnimating ? null : 0,
            child: Column(
              children: [
                const SizedBox(height: AppDimensions.medium),
                Text(
                  'К сожалению, Вы не прошли CAPTCHA.\nДо следующией попытки: '
                  '${60 - (60 * _animationController.value).floor()} сек.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.medium),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: context.locale.questionConsentText,
                  style: themePath.titleSmall?.copyWith(
                    color: colorPath.secondaryTextColor,
                  ),
                ),
                TextSpan(
                  text: ' ${context.locale.personalDataProcessingText}',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => AppRouter.appRouter.navigateTo(
                          CustomRoute(
                            RouteType.navigateTo,
                            termsOfUseConfig(),
                          ),
                        ),
                  style: themePath.titleSmall?.copyWith(
                    color: colorPath.mainAppColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
