import 'package:avtovas_web/src/common/constants/app_assets.dart';
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/app_fonts.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/avtovas_contacts_aside.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/avtovas_contacts_info_section.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/avtovas_contacts_main.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/question_form.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/section_tile.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class AvtovasContactsPageBody extends StatelessWidget {
  const AvtovasContactsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localePath = context.locale;
    final themePath = context.themeData.textTheme;
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal:
            context.availableWidth > AppDimensions.minWebDesktopResolutionWidth
                ? AppDimensions.rootPaddingLeft
                : AppDimensions.large,
        vertical: AppDimensions.large,
      ),
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: AppDimensions.large,
          ),
          child: Text(
            '${context.locale.main} / ${context.locale.help} / ${context.locale.inquiry}',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.large,
          ),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: AppDimensions.large,
                ),
                child: Text(
                  context.locale.inquiry,
                  style: context.themeData.textTheme.titleLarge?.copyWith(
                    fontSize: AppFonts.extraLarge,
                    fontWeight: AppFonts.titleWeight,
                  ),
                ),
              ),
            ],
          ),
        ),
        context.availableWidth < AppDimensions.minWebDesktopResolutionWidth
            ? Wrap(
                children: [
                  AvtovasContactsAside(),
                  Column(
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
                      QuestionForm(
                        nameOnChanged: (value) {},
                        emailOnChanged: (value) {},
                        phoneOnChanged: (value) {},
                        questionOnChanged: (value) {},
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AvtovasContactsAside(),
                  AvtovasContactsMain(),
                ],
              )
      ],
    );
  }
}
