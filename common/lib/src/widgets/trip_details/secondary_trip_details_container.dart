import 'package:common/avtovas_common.dart';
import 'package:common/src/widgets/trip_details/details_container.dart';
import 'package:flutter/material.dart';

final class SecondaryTripDetailsContainer extends StatelessWidget {
  final String carrierCompany;
  final String transport;

  const SecondaryTripDetailsContainer({
    required this.carrierCompany,
    required this.transport,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fivefoldTextStyle = context.themeData.textTheme.bodyLarge?.copyWith(
      color: context.theme.fivefoldTextColor,
    );

    return DetailsContainer(
      children: <Widget>[
        Text(carrierCompany),
        Text(
          context.locale.carrier,
          style: fivefoldTextStyle,
        ),
        Text(transport),
        Text(
          context.locale.secondaryDetailsMessage,
          style: fivefoldTextStyle,
        ),
      ].insertBetween(
        const SizedBox(height: CommonDimensions.medium),
      ),
    );
  }
}
