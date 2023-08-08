import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_widgets.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

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
            hintText: context.locale.enterName,
            onChanged: nameOnChanged,
          ),
          const SizedBox(height: AppDimensions.large),
          InputField(
            hintText: context.locale.emailExample,
            onChanged: emailOnChanged,
          ),
          const SizedBox(height: AppDimensions.large),
          InputField(
            hintText: context.locale.enterPhoneNumber,
            onChanged: phoneOnChanged,
          ),
          const SizedBox(height: AppDimensions.large),
          InputField(
            hintText: context.locale.enterQuestion,
            onChanged: questionOnChanged,
            minLines: 7,
            maxLines: 8,
          ),
          const SizedBox(height: AppDimensions.large),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(AppDimensions.large),
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorPath.mainAppColor,
                borderRadius: const BorderRadius.all(
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
