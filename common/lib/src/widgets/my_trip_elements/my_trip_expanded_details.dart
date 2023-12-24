import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';

// ignore_for_file: avoid-shrink-wrap-in-lists

class MyTripExpandedDetails extends StatelessWidget {
  final String carrier;
  final String transport;
  final String ticketPrice;
  final String seats;
  final List<CommonPassenger> passengers;

  const MyTripExpandedDetails({
    required this.carrier,
    required this.transport,
    required this.ticketPrice,
    required this.seats,
    required this.passengers,
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
        _HeadlineSmallTitle(title: carrier),

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
        _HeadlineSmallTitle(title: transport),
        const SizedBox(height: CommonDimensions.medium),
        _TitleMediumText(
          title: context.locale.carrierRights,
        ),

        // Passengers list
        const SizedBox(height: CommonDimensions.extraLarge),
        _HeadlineLargeTitle(title: context.locale.passenger),
        const SizedBox(height: CommonDimensions.large),
        Column(
          children: <Widget>[
            for (final passenger in passengers)
              _PassengersInfoColumn(passenger: passenger),
          ].insertBetween(
            const SizedBox(height: CommonDimensions.large),
          ),
        ),

        // Number of tickets and price
        const SizedBox(height: CommonDimensions.large),
        _SeatAndPriceRow(
          seats: seats,
          price: ticketPrice,
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
  final String seats;
  final String price;

  const _SeatAndPriceRow({
    required this.seats,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${context.locale.seat}: $seats',
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
  final CommonPassenger passenger;

  const _PassengersInfoColumn({required this.passenger});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PassengersTile(
          title: passenger.fullName,
          svgAssetPath: ImagesAssets.personIcon,
        ),
      ],
    );
  }
}
