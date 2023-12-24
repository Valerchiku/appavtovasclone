import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class MyCompletedTrip extends StatelessWidget {
  final bool smartLayout;
  final StatusedTrip trip;

  const MyCompletedTrip({
    required this.smartLayout,
    required this.trip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AvtovasPlatform.isWeb
            ? context.theme.containerBackgroundColor
            : context.theme.detailsBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.medium,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.large),
        child: ExpansionContainer(
          sizeBetweenElements: AppDimensions.large,
          title: _CompletedTripTitles(
            orderNumber: '${context.locale.orderNum} ${trip.trip.routeNum}',
            arrivalDate: trip.trip.arrivalTime.formatHmdM(context),
            departurePlace: trip.trip.departure.name,
            arrivalPlace: trip.trip.destination.name,
          ),
          children: <Widget>[
            if (smartLayout)
              Column(
                children: [
                  MyTripDetails(
                    arrivalDateTime: trip.trip.arrivalTime,
                    departureDateTime: trip.trip.departureTime,
                    arrivalAddress: trip.trip.destination.address ?? '',
                    departureAddress: trip.trip.departure.address ?? '',
                    departurePlace: trip.trip.departure.name,
                    arrivalPlace: trip.trip.destination.name,
                    timeInRoad: trip.trip.duration.formatDuration(),
                  ),
                  MyTripExpandedDetails(
                    seats: trip.places.join(', '),
                    passengers: List.generate(
                      trip.passengers.length,
                      (index) => CommonPassenger(
                        fullName: trip.passengers[index].lastName,
                      ),
                    ),
                    carrier: trip.trip.carrier,
                    ticketPrice: context.locale.price(trip.saleCost),
                    transport:
                        trip.trip.carrierData.carrierPersonalData.first.name,
                  ),
                ],
              ),
            if (!smartLayout)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MyTripDetails(
                      arrivalDateTime: trip.trip.arrivalTime,
                      departureDateTime: trip.trip.departureTime,
                      arrivalAddress: trip.trip.destination.address ?? '',
                      departureAddress: trip.trip.departure.address ?? '',
                      departurePlace: trip.trip.departure.name,
                      arrivalPlace: trip.trip.destination.name,
                      timeInRoad: trip.trip.duration.formatDuration(),
                    ),
                  ),
                  Expanded(
                    child: MyTripExpandedDetails(
                      seats: trip.places.join(', '),
                      passengers: List.generate(
                        trip.passengers.length,
                            (index) => CommonPassenger(
                          fullName: trip.passengers[index].lastName,
                        ),
                      ),
                      carrier: trip.trip.carrier,
                      ticketPrice: context.locale.price(trip.saleCost),
                      transport:
                          trip.trip.carrierData.carrierPersonalData.first.name,
                    ),
                  ),
                ],
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
  final String orderNumber;
  final String departurePlace;
  final String arrivalPlace;
  final String arrivalDate;

  const _CompletedTripTitles({
    required this.orderNumber,
    required this.departurePlace,
    required this.arrivalPlace,
    required this.arrivalDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          orderNumber,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: WebFonts.weightRegular,
          ),
        ),
        Text(
          '$departurePlace - $arrivalPlace',
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.mainAppColor,
            fontSize: WebFonts.detailsDescSize,
          ),
        ),
        Text(
          arrivalDate,
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            fontWeight: WebFonts.weightRegular,
          ),
        ),
      ],
    );
  }
}
