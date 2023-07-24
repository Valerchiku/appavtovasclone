import 'package:avtovas_mobile/src/features/trip_details/widgets/trip_details_body.dart';
import 'package:flutter/material.dart';

final class TripDetailsPage extends StatelessWidget {
  const TripDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TripDetailsBody(),
    );
  }
}
