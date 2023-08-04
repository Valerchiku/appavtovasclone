import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class MyTripDetails extends StatelessWidget {
  final MockTrip mockTrip;
  const MyTripDetails({
    required this.mockTrip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const maxSize = 120.0;
    return TripLine.vertical(
      maxSize: maxSize,
      firstPointTitle: '${mockTrip.arrivalTime}, ${mockTrip.arrivalDate}',
      secondPointTitle: '${mockTrip.departureTime}, ${mockTrip.departureDate}',
      firstPointSubtitle: mockTrip.arrivalPlace,
      firstPointDescription: mockTrip.arrivalAddress,
      secondPointSubtitle: mockTrip.departurePlace,
      secondPointDescription: mockTrip.departureAddress,
      lineDescription: mockTrip.timeInRoad,
    );
  }
}
