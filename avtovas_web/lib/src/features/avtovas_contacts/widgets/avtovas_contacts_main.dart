import 'package:avtovas_web/src/common/constants/app_assets.dart';
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/avtovas_contacts_info_section.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/question_form.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/section_tile.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class AvtovasContactsMain extends StatelessWidget {
  const AvtovasContactsMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localePath = context.locale;
    final themePath = context.themeData.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: localePath.askQuestion),
        const SizedBox(height: AppDimensions.large),
        Text(
          localePath.ourQualifiedExpertsWillHelp,
          style: themePath.titleLarge,
          maxLines: null,
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: context.availableWidth / 2.73,
          ),
          child: QuestionForm(
            nameOnChanged: (value) {},
            emailOnChanged: (value) {},
            phoneOnChanged: (value) {},
            questionOnChanged: (value) {},
            onTap: () {},
          ),
        )
      ],
    );
  }
}
