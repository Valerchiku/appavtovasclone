import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class MyCompletedTrip extends StatefulWidget {
  final bool smartLayout;
  final StatusedTrip trip;

  const MyCompletedTrip({
    required this.smartLayout,
    required this.trip,
    super.key,
  });

  @override
  State<MyCompletedTrip> createState() => _MyCompletedTripState();
}

class _MyCompletedTripState extends State<MyCompletedTrip> {
  var _shouldShowContainerContent = false;

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
          onClosed: () => setState(() => _shouldShowContainerContent = false),
          onStatusChanged: (status) {
            if (status) setState(() => _shouldShowContainerContent = true);
          },
          sizeBetweenElements: AppDimensions.large,
          title: Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _CompletedTripTitles(
                    orderNumber:
                        '${context.locale.orderNum} ${widget.trip.trip.routeNum}',
                    arrivalDate:
                        widget.trip.trip.arrivalTime.formatHmdM(context),
                    departurePlace: widget.trip.trip.departure.name,
                    arrivalPlace: widget.trip.trip.destination.name,
                  ),
                ),
              ],
            ),
          ),
          children: _shouldShowContainerContent
              ? <Widget>[
                  if (widget.smartLayout)
                    Column(
                      children: [
                        MyTripDetails(
                          arrivalDateTime: widget.trip.trip.arrivalTime,
                          departureDateTime: widget.trip.trip.departureTime,
                          arrivalAddress:
                              widget.trip.trip.destination.address ?? '',
                          departureAddress:
                              widget.trip.trip.departure.address ?? '',
                          departurePlace: widget.trip.trip.departure.name,
                          arrivalPlace: widget.trip.trip.destination.name,
                          timeInRoad:
                              widget.trip.trip.duration.formatDuration(),
                        ),
                        MyTripExpandedDetails(
                          seats: widget.trip.places.join(', '),
                          passengers: List.generate(
                            widget.trip.passengers.length,
                            (index) => CommonPassenger(
                              fullName: widget.trip.passengers[index].lastName,
                            ),
                          ),
                          carrier: widget.trip.trip.carrier,
                          ticketPrice:
                              context.locale.price(widget.trip.saleCost),
                          transport: widget.trip.trip.carrierData
                              .carrierPersonalData.first.name,
                        ),
                      ],
                    ),
                  if (!widget.smartLayout)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: MyTripDetails(
                            arrivalDateTime: widget.trip.trip.arrivalTime,
                            departureDateTime: widget.trip.trip.departureTime,
                            arrivalAddress:
                                widget.trip.trip.destination.address ?? '',
                            departureAddress:
                                widget.trip.trip.departure.address ?? '',
                            departurePlace: widget.trip.trip.departure.name,
                            arrivalPlace: widget.trip.trip.destination.name,
                            timeInRoad:
                                widget.trip.trip.duration.formatDuration(),
                          ),
                        ),
                        Expanded(
                          child: MyTripExpandedDetails(
                            seats: widget.trip.places.join(', '),
                            passengers: List.generate(
                              widget.trip.passengers.length,
                              (index) => CommonPassenger(
                                fullName: _generatePassengerFullName(
                                  widget.trip.passengers[index],
                                ),
                              ),
                            ),
                            carrier: widget.trip.trip.carrier,
                            ticketPrice:
                                context.locale.price(widget.trip.saleCost),
                            transport: widget.trip.trip.carrierData
                                .carrierPersonalData.first.name,
                          ),
                        ),
                      ],
                    ),
                ].insertBetween(
                  const SizedBox(
                    height: AppDimensions.extraLarge,
                  ),
                )
              : [],
        ),
      ),
    );
  }

  String _generatePassengerFullName(Passenger passenger) {
    final lastNameFirstLetter =
        passenger.firstName.characters.characterAt(0).toUpperCase();

    final surnameFirstLetter =
        passenger.surname != null && passenger.surname!.isNotEmpty
            ? '${passenger.surname!.characters.characterAt(0).toUpperCase()}.'
            : '';

    return '${passenger.lastName} $lastNameFirstLetter. $surnameFirstLetter';
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
          '$departurePlace - $arrivalPlace ',
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
