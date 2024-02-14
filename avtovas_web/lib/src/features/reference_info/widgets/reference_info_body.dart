// ignore: implementation_imports
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:avtovas_web/src/features/reference_info/widgets/reference_info_item.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_utils.dart';

// ignore: implementation_imports
import 'package:flutter/material.dart';

class ReferenceInfoBody extends StatelessWidget {
  final bool smartLayout;

  const ReferenceInfoBody({
    required this.smartLayout,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            smartLayout ? AppDimensions.medium : AppDimensions.extraLarge,
        vertical: smartLayout ? AppDimensions.medium : AppDimensions.extraLarge,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.locale.referenceInfo,
              style: context.themeData.textTheme.displayMedium?.copyWith(
                fontSize: WebFonts.sizeDisplayLarge,
              ),
            ),
            const SizedBox(height: AppDimensions.large),
            const _ReferenceBlockHeaderText(text: 'Оформление заказа'),
            const SizedBox(height: AppDimensions.medium),
            ...<Widget>[
              for (final reference
                  in BasicQuestions.ticketingQuestions(context))
                ReferenceInfoItem(
                  title: reference.question,
                  content: reference.answer,
                ),
            ].insertBetween(
              const Divider(height: AppDimensions.large),
            ),
            const SizedBox(height: AppDimensions.large),
            const _ReferenceBlockHeaderText(text: 'Возврат заказа'),
            const SizedBox(height: AppDimensions.medium),
            ...<Widget>[
              for (final reference in BasicQuestions.refundQuestions(context))
                ReferenceInfoItem(
                  title: reference.question,
                  content: reference.answer,
                ),
            ].insertBetween(
              const Divider(height: AppDimensions.large),
            ),
            const SizedBox(height: AppDimensions.large),
            const _ReferenceBlockHeaderText(text: 'Посадка в автобус'),
            const SizedBox(height: AppDimensions.medium),
            ...<Widget>[
              for (final reference in BasicQuestions.seatingQuestions(context))
                ReferenceInfoItem(
                  title: reference.question,
                  content: reference.answer,
                ),
            ].insertBetween(
              const Divider(height: AppDimensions.large),
            ),
            const SizedBox(height: AppDimensions.large),
            const _ReferenceBlockHeaderText(text: 'Предложения и жалобы'),
            const SizedBox(height: AppDimensions.medium),
            ...<Widget>[
              for (final reference in BasicQuestions.supportQuestions(context))
                ReferenceInfoItem(
                  title: reference.question,
                  content: reference.answer,
                ),
            ].insertBetween(
              const Divider(height: AppDimensions.large),
            ),
          ],
        ),
      ),
    );
  }
}

final class _ReferenceBlockHeaderText extends StatelessWidget {
  final String text;

  const _ReferenceBlockHeaderText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.themeData.textTheme.bodyLarge?.copyWith(
        fontSize: WebFonts.sizeHeadlineLarge,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
