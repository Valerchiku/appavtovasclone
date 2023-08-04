import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_widgets.dart';
import 'package:common/avtovas_common_utils.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';

// ignore_for_file: avoid-shrink-wrap-in-lists

class MyTripExpandedDetails extends StatelessWidget {
  final MockTrip mockTrip;
  final List<MockPassenger> mockPassenger;
  const MyTripExpandedDetails({
    required this.mockTrip,
    required this.mockPassenger,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Carrier and Company
        _HeadlineLargeTitle(title: context.locale.carrier),
        const SizedBox(height: CommonDimensions.large),
        _HeadlineSmallTitle(title: mockTrip.carrier),

        // Carrier transport and rights
        const SizedBox(height: CommonDimensions.medium),
        _HeadlineSmallTitle(
          title: context.locale.transport,
          textStyle: context.themeData.textTheme.headlineSmall?.copyWith(
            fontWeight: CommonFonts.weightRegular,
            color: context.theme.fivefoldTextColor,
          ),
        ),
        const SizedBox(height: CommonDimensions.medium),
        _HeadlineSmallTitle(title: mockTrip.transport),
        const SizedBox(height: CommonDimensions.medium),
        _TitleMediumText(
          title: context.locale.carrierRights,
        ),

        // Passengers list
        const SizedBox(height: CommonDimensions.extraLarge),
        _HeadlineLargeTitle(title: context.locale.passenger),
        const SizedBox(height: CommonDimensions.large),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) =>
              const SizedBox(height: CommonDimensions.large),
          itemBuilder: (context, index) => _PassengersInfoColumn(
            mockPassenger: mockPassenger,
            index: index,
          ),
          itemCount: mockPassenger.length,
        ),

        // Number of tickets and price
        const SizedBox(height: CommonDimensions.large),
        _SeatAndPriceRow(
          seat: mockPassenger.length.toString(),
          price: mockTrip.ticketPrice,
        ),
      ],
    );
  }
}

class _HeadlineLargeTitle extends StatelessWidget {
  final String title;
  const _HeadlineLargeTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.themeData.textTheme.headlineMedium?.copyWith(
        fontSize: CommonFonts.detailsDescSize,
        fontWeight: CommonFonts.weightRegular,
        color: context.theme.quaternaryTextColor,
      ),
    );
  }
}

class _HeadlineSmallTitle extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  const _HeadlineSmallTitle({
    required this.title,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle ??
          context.themeData.textTheme.headlineSmall?.copyWith(
            fontWeight: CommonFonts.weightRegular,
            color: context.theme.secondaryTextColor,
          ),
    );
  }
}

class _TitleMediumText extends StatelessWidget {
  final String title;
  const _TitleMediumText({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.themeData.textTheme.titleMedium?.copyWith(
        fontWeight: CommonFonts.weightRegular,
        color: context.theme.fivefoldTextColor,
      ),
    );
  }
}

class _PassengersTile extends StatelessWidget {
  final String title;
  final String svgAssetPath;

  const _PassengersTile({
    required this.title,
    required this.svgAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvtovasVectorImage(
          svgAssetPath: svgAssetPath,
        ),
        const SizedBox(width: CommonDimensions.medium),
        _HeadlineSmallTitle(title: title),
      ],
    );
  }
}

class _SeatAndPriceRow extends StatelessWidget {
  final String seat;
  final String price;
  const _SeatAndPriceRow({
    required this.seat,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${context.locale.seat}: $seat',
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            fontWeight: CommonFonts.weightRegular,
          ),
        ),
        Text(
          price,
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _PassengersInfoColumn extends StatelessWidget {
  final List<MockPassenger> mockPassenger;
  final int index;
  const _PassengersInfoColumn({
    required this.mockPassenger,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PassengersTile(
          title: mockPassenger[index].fullName,
          svgAssetPath: ImagesAssets.personIcon,
        ),
        const SizedBox(height: CommonDimensions.medium),
        _PassengersTile(
          title: '${context.locale.seat}: ${mockPassenger[index].seatOnTheBus}',
          svgAssetPath: ImagesAssets.busIcon,
        ),
      ],
    );
  }
}
