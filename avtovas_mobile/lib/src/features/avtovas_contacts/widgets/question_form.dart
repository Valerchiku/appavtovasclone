import 'package:another_flushbar/flushbar.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore_for_file: implementation_imports,
// ignore_for_file: directives_ordering
// ignore_for_file: no-magic-number

class QuestionForm extends StatefulWidget {
  final void Function(String, String, String, String) onSend;
  final VoidCallback onTermsOfUseTextTap;

  const QuestionForm({
    required this.onSend,
    required this.onTermsOfUseTextTap,
    super.key,
  });

  @override
  State<QuestionForm> createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  late final List<TextEditingController> _controllers;
  late final List<GlobalKey<FormState>> _keys;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(4, (_) => TextEditingController());
    _keys = List.generate(4, (_) => GlobalKey<FormState>());
  }

  String? _emptyFormValidator(String? value) {
    return value == null || value.isEmpty ? 'Поле должно быть заполнено' : null;
  }

  bool _validateFields() {
    final validates = <bool>[];

    for (final formKey in _keys) {
      validates.add(formKey.currentState!.validate());
    }

    return !validates.contains(false);
  }

  void _clearControllers() {
    for (var i = 0; i < _keys.length; i++) {
      _keys[i].currentState!.reset();
      _controllers[i].clear();
    }
  }

  void _sendQuestion() {
    if (!_validateFields()) return;

    widget.onSend(
      _controllers[0].text,
      _controllers[1].text,
      _controllers[2].text,
      _controllers[3].text,
    );

    _clearControllers();

    if (context.mounted) _showFlushBar(context);
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
          fontSize: AppFonts.appBarFontSize,
        ),
      ),
      isDismissible: false,
      duration: const Duration(seconds: 7),
      animationDuration: const Duration(milliseconds: 150),
      messageText: Text(
        'Спасибо за то, что помогаете сделать систему лучше. '
        'В скором будущем с Вами свяжутся.',
        style: context.themeData.textTheme.bodyLarge?.copyWith(
          fontSize: AppFonts.sizeHeadlineMedium,
        ),
      ),
    ).show(context);
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themePath = context.themeData.textTheme;
    return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorPath.detailsBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.medium),
        ),
      ),
      child: Column(
        children: <Widget>[
          InputField(
            controller: _controllers[0],
            formKey: _keys[0],
            onChanged: (value) {
              if (value.isNotEmpty) _keys[0].currentState?.validate();
            },
            validator: _emptyFormValidator,
            hintText: context.locale.enterName,
          ),
          const SizedBox(height: AppDimensions.large),
          InputField(
            controller: _controllers[1],
            formKey: _keys[1],
            onChanged: (value) {
              if (value.isNotEmpty) _keys[1].currentState?.validate();
            },
            validator: _emptyFormValidator,
            hintText: context.locale.emailExample,
          ),
          const SizedBox(height: AppDimensions.large),
          InputField(
            controller: _controllers[2],
            formKey: _keys[2],
            onChanged: (value) {
              if (value.isNotEmpty) _keys[2].currentState?.validate();
            },
            validator: _emptyFormValidator,
            hintText: context.locale.enterPhoneNumber,
          ),
          const SizedBox(height: AppDimensions.large),
          InputField(
            controller: _controllers[3],
            formKey: _keys[3],
            onChanged: (value) {
              if (value.isNotEmpty) _keys[3].currentState?.validate();
            },
            validator: _emptyFormValidator,
            minLines: 7,
            maxLines: 8,
          ),
          const SizedBox(height: AppDimensions.large),
          Material(
            color: colorPath.mainAppColor,
            child: InkWell(
              onTap: _sendQuestion,
              child: Container(
                padding: const EdgeInsets.all(AppDimensions.large),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppDimensions.small),
                  ),
                ),
                child: Center(
                  child: Text(
                    context.locale.askQuestion,
                    style: themePath.headlineMedium?.copyWith(
                      color: colorPath.containerBackgroundColor,
                      fontWeight: AppFonts.weightRegular,
                    ),
                  ),
                ),
              ),
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
                    ..onTap = widget.onTermsOfUseTextTap,
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
