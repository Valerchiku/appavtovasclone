import 'package:common/src/localization/localizations_ext.dart';
import 'package:common/src/theme/theme_extension.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/widgets/avtovas_buttons/avtovas_button.dart';
import 'package:flutter/material.dart';

final class ExpandedTripInformation extends StatelessWidget {
  final String ticketPrice;
  final String freePlaces;
  final bool isSmart;
  final VoidCallback onBuyTap;

  const ExpandedTripInformation({
    required this.ticketPrice,
    required this.freePlaces,
    required this.isSmart,
    required this.onBuyTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final buyTicket = context.locale.buyTicket;

    return !isSmart
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TicketPriceText(ticketPrice: ticketPrice),
              FreePlacesBody(
                freePlaces: freePlaces,
              ),
              const SizedBox(
                height:
                    CommonDimensions.extraLarge + CommonDimensions.extraSmall,
              ),
              AvtovasButton.text(
                buttonText: buyTicket,
                onTap: onBuyTap,
              ),
            ],
          )
        : Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TicketPriceText(ticketPrice: ticketPrice),
                  FreePlacesBody(
                    freePlaces: freePlaces,
                  ),
                ],
              ),
              const Spacer(),
              if (freePlaces != '0')
                AvtovasButton.text(
                  buttonText: buyTicket,
                  onTap: onBuyTap,
                ),
            ],
          );
  }
}

final class TicketPriceText extends StatelessWidget {
  final String ticketPrice;

  const TicketPriceText({required this.ticketPrice});

  @override
  Widget build(BuildContext context) {
    return Text(
      ticketPrice,
      style: context.themeData.textTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

final class FreePlacesBody extends StatelessWidget {
  final String freePlaces;

  const FreePlacesBody({
    required this.freePlaces,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeData.textTheme.bodyLarge;

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: context.locale.placesLeft,
            style: textTheme,
          ),
          if (freePlaces != '0')
            TextSpan(
              text: context.locale.freePlaces(int.parse(freePlaces)),
              style: textTheme?.copyWith(
                color: context.theme.mainAppColor,
              ),
            ),
        ],
      ),
    );
  }
}
