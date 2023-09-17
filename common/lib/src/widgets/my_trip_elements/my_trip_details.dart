import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class MyTripDetails extends StatelessWidget {
  final String departureDateTime;
  final String arrivalDateTime;
  final String arrivalPlace;
  final String arrivalAddress;
  final String departurePlace;
  final String departureAddress;
  final String timeInRoad;

  const MyTripDetails({
    required this.departureDateTime,
    required this.arrivalDateTime,
    required this.arrivalPlace,
    required this.arrivalAddress,
    required this.departurePlace,
    required this.departureAddress,
    required this.timeInRoad,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const maxSize = 120.0;
    return TripLine.vertical(
      maxSize: maxSize,
      firstPointTitle: departureDateTime.isEmpty ? '' : departureDateTime
          .formatHmdM(context),
      secondPointTitle: arrivalDateTime.isEmpty ? '' : arrivalDateTime
          .formatHmdM(
          context),
      firstPointSubtitle: arrivalPlace,
      firstPointDescription: arrivalAddress,
      secondPointSubtitle: departurePlace,
      secondPointDescription: departureAddress,
      lineDescription: timeInRoad,
    );
  }
}
