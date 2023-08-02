import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:common/src/widgets/input_field/input_field.dart';

// ignore_for_file: implementation_imports,
// ignore_for_file: directives_ordering
// ignore_for_file: no-magic-number

class QuestionForm extends StatelessWidget {
  final ValueChanged nameOnChanged;
  final ValueChanged emailOnChanged;
  final ValueChanged phoneOnChanged;
  final ValueChanged questionOnChanged;
  final VoidCallback onTap;
  const QuestionForm({
    required this.nameOnChanged,
    required this.emailOnChanged,
    required this.phoneOnChanged,
    required this.questionOnChanged,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themePath = context.themeData.textTheme;
    return Container(
      padding: const EdgeInsets.all(CommonDimensions.large),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorPath.detailsBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(CommonDimensions.medium),
        ),
      ),
      child: Column(
        children: <Widget>[
          InputField(
            hintText: context.locale.enterName,
            onChanged: nameOnChanged,
          ),
          const SizedBox(height: CommonDimensions.large),
          InputField(
            hintText: context.locale.emailExample,
            onChanged: emailOnChanged,
          ),
          const SizedBox(height: CommonDimensions.large),
          InputField(
            hintText: context.locale.enterPhoneNumber,
            onChanged: phoneOnChanged,
          ),
          const SizedBox(height: CommonDimensions.large),
          InputField(
            hintText: context.locale.enterQuestion,
            onChanged: questionOnChanged,
            minLines: 7,
            maxLines: 8,
          ),
          const SizedBox(height: CommonDimensions.large),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(CommonDimensions.large),
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorPath.mainAppColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(CommonDimensions.small),
                ),
              ),
              child: Center(
                child: Text(
                  context.locale.askQuestion,
                  style: themePath.headlineMedium?.copyWith(
                    color: colorPath.whitespaceContainerColor,
                    fontWeight: CommonFonts.weightRegular,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: CommonDimensions.medium),
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
