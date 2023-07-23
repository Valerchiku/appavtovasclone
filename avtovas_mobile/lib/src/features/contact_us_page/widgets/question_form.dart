import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:common/src/widgets/input_field/input_field.dart';

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
            hintText: context.locale.enter_name,
            controller: TextEditingController(),
          ),
          const SizedBox(height: CommonDimensions.large),
          InputField(
            hintText: context.locale.email_example,
            controller: TextEditingController(),
          ),
          const SizedBox(height: CommonDimensions.large),
          InputField(
            hintText: context.locale.enter_phone_number,
            controller: TextEditingController(),
          ),
          const SizedBox(height: CommonDimensions.large),
          InputField(
            hintText: context.locale.enter_question,
            controller: TextEditingController(),
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
                  context.locale.ask_a_question,
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
                  text: context.locale.question_consent_text,
                  style: themePath.titleSmall?.copyWith(
                    color: colorPath.secondaryTextColor,
                  ),
                ),
                TextSpan(
                  text: ' ${context.locale.personal_data_processing_text}',
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
