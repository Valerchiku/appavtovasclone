import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_utils.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:common/src/widgets/utils_widgets/trip_horizontal_painter.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer-conditional-expressions
// ignore_for_file: prefer-moving-to-variable

final class TripLine extends StatelessWidget {
  final String firstPointTitle;
  final String secondPointTitle;
  final String? firstPointSubtitle;
  final String? firstPointDescription;
  final String? secondPointSubtitle;
  final String? secondPointDescription;
  final String? lineDescription;
  final double? maxSize;

  final bool isVertical;

  const TripLine.vertical({
    required this.maxSize,
    required this.firstPointTitle,
    required this.secondPointTitle,
    required this.firstPointSubtitle,
    required this.firstPointDescription,
    required this.secondPointSubtitle,
    required this.secondPointDescription,
    this.lineDescription,
    super.key,
  }) : isVertical = true;

  const TripLine.horizontal({
    required this.firstPointTitle,
    required this.secondPointTitle,
    required this.maxSize,
    required this.lineDescription,
    required this.secondPointSubtitle,
    required this.firstPointSubtitle,
    super.key,
  })  : isVertical = false,
        firstPointDescription = null,
        secondPointDescription = null;

  @override
  Widget build(BuildContext context) {
    final textTitleLarge = context.themeData.textTheme.titleLarge;
    final textHeadlineMedium = context.themeData.textTheme.headlineMedium;
    final isWeb = AvtovasPlatform.isWeb;

    if (isVertical) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const _Circle(),
                  _Line(
                    isVertical: isVertical,
                    maxSize: maxSize ?? CommonDimensions.expandedTripLineWidth,
                  ),
                ],
              ),
              const SizedBox(width: CommonDimensions.medium),
              Flexible(
                child: _PlacementText(
                  pointTitle: firstPointTitle,
                  pointSubtitle: firstPointSubtitle ?? '',
                  pointDescription: firstPointDescription ?? '',
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Circle(),
              const SizedBox(width: CommonDimensions.medium),
              Flexible(
                child: _PlacementText(
                  pointTitle: secondPointTitle,
                  pointSubtitle: secondPointSubtitle ?? '',
                  pointDescription: secondPointDescription ?? '',
                  lineDescription: lineDescription,
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Row(
        children: [
          _SubtitleContainer(text: firstPointSubtitle ?? ''),
          SizedBox(
            width: isWeb ? CommonDimensions.large : CommonDimensions.small,
          ),
          Text(
            firstPointTitle,
            style: textHeadlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: CommonFonts.detailsDescSize,
              color: context.theme.mainAppColor,
            ),
          ),
          SizedBox(
            width: isWeb ? CommonDimensions.large : CommonDimensions.none,
          ),
          if (maxSize == null)
            Expanded(
              child: CustomPaint(
                painter: TripHorizontalPainter(
                  lineHeader: lineDescription ?? '',
                  textStyle: textTitleLarge?.copyWith(
                    color: context.theme.fivefoldTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                  lineColor: context.theme.mainAppColor,
                ),
              ),
            )
          else
            CustomPaint(
              size: Size(maxSize!, Size.zero.height),
              painter: TripHorizontalPainter(
                lineHeader: lineDescription ?? '',
                textStyle: textTitleLarge?.copyWith(
                  color: context.theme.fivefoldTextColor,
                  fontWeight: FontWeight.bold,
                ),
                lineColor: context.theme.mainAppColor,
              ),
            ),
          SizedBox(
            width: isWeb ? CommonDimensions.large : CommonDimensions.none,
          ),
          Text(
            secondPointTitle,
            style: textHeadlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: CommonFonts.detailsDescSize,
              color: context.theme.mainAppColor,
            ),
          ),
          SizedBox(
            width: isWeb ? CommonDimensions.large : CommonDimensions.small,
          ),
          _SubtitleContainer(text: secondPointSubtitle!),
        ],
      );
    }
  }
}

final class _PlacementText extends StatelessWidget {
  final String pointTitle;
  final String pointSubtitle;
  final String pointDescription;
  final String? lineDescription;
  const _PlacementText({
    required this.pointTitle,
    required this.pointSubtitle,
    required this.pointDescription,
    this.lineDescription,
  });

  @override
  Widget build(BuildContext context) {
    final textTitleLarge = context.themeData.textTheme.titleLarge;
    final textHeadlineMedium = context.themeData.textTheme.headlineMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pointTitle,
          style: textTitleLarge?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: FontWeight.w700,
            height: CommonFonts.sizeFactorMedium,
          ),
        ),
        const SizedBox(height: CommonDimensions.small),
        Text(
          pointSubtitle,
          style: textHeadlineMedium?.copyWith(
            fontSize: CommonFonts.detailsDescSize,
            color: context.theme.tertiaryTextColor,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: CommonDimensions.small),
        Text(
          pointDescription,
          style: textTitleLarge?.copyWith(
            color: context.theme.secondaryTextColor,
          ),
        ),
        const SizedBox(height: CommonDimensions.large),
        if (lineDescription != null)
          Text(
            '${context.locale.inTransit}: $lineDescription',
            style: textTitleLarge?.copyWith(
              color: context.theme.quaternaryTextColor,
            ),
          ),
      ],
    );
  }
}

final class _SubtitleContainer extends StatelessWidget {
  final String text;

  const _SubtitleContainer({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: CommonDimensions.medium,
        vertical: CommonDimensions.extraSmall,
      ),
      decoration: BoxDecoration(
        color: context.theme.containerBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(CommonDimensions.small),
        ),
      ),
      child: Text(
        text,
        style: context.themeData.textTheme.bodyLarge?.copyWith(
          color: context.theme.fivefoldTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

final class _Line extends StatelessWidget {
  final double? maxSize;
  final bool isVertical;

  const _Line({
    required this.isVertical,
    this.maxSize,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.theme.mainAppColor,
      child: SizedBox(
        width: isVertical ? CommonDimensions.extraSmall : maxSize,
        height: isVertical ? maxSize : CommonDimensions.extraSmall,
      ),
    );
  }
}

final class _Circle extends StatelessWidget {
  const _Circle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CommonDimensions.large,
      height: CommonDimensions.large,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.theme.mainAppColor,
          width: CommonDimensions.extraSmall,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(CommonDimensions.extraLarge),
        ),
      ),
    );
  }
}
