import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class MyCompletedTrip extends StatelessWidget {
  final MockTrip mockTrip;
  final List<MockPassenger> mockPassenger;
  final String orderNumber;

  const MyCompletedTrip({
    required this.mockPassenger,
    required this.mockTrip,
    required this.orderNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.theme.detailsBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.medium,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.large),
        child: ExpansionContainer(
          title: _CompletedTripTitles(
            orderNumber: orderNumber,
            mockTrip: mockTrip,
          ),
          children: <Widget>[
            MyTripDetails(mockTrip: mockTrip),
            MyTripExpandedDetails(
              mockTrip: mockTrip,
              mockPassenger: mockPassenger,
            ),
          ].insertBetween(
            const SizedBox(
              height: AppDimensions.extraLarge,
            ),
          ),
        ),
      ),
    );
  }
}

class _CompletedTripTitles extends StatelessWidget {
  const _CompletedTripTitles({
    required this.orderNumber,
    required this.mockTrip,
  });

  final String orderNumber;
  final MockTrip mockTrip;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          orderNumber,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        Text(
          '${mockTrip.departurePlace} - ${mockTrip.arrivalPlace}',
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.mainAppColor,
            fontSize: AppFonts.detailsDescSize,
          ),
        ),
        Text(
          mockTrip.arrivalDate,
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            fontWeight: AppFonts.weightRegular,
          ),
        ),
      ],
    );
  }
}
