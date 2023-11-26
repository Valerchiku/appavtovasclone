import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

// ignore_for_file: implementation_imports,
// ignore_for_file: directives_ordering
// ignore_for_file: no-magic-number

class QuestionForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController questionController;
  final VoidCallback onTap;
  const QuestionForm({
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.questionController,
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
        color: colorPath.whiteTextColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.medium),
        ),
      ),
      child: Column(
        children: <Widget>[
          InputField(
            hintText: context.locale.enterName,
            controller: nameController,
          ),
          const SizedBox(height: AppDimensions.large),
          InputField(
            hintText: context.locale.emailExample,
            controller: emailController,
          ),
          const SizedBox(height: AppDimensions.large),
          InputField(
            hintText: context.locale.enterPhoneNumber,
            controller: phoneController,
          ),
          const SizedBox(height: AppDimensions.large),
          InputField(
            hintText: context.locale.enterQuestion,
            controller: questionController,
            minLines: 7,
            maxLines: 8,
          ),
          const SizedBox(height: AppDimensions.large),
          GestureDetector(
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
                    fontWeight: WebFonts.weightRegular,
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
