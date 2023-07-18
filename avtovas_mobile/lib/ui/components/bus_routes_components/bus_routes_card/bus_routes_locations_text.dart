import 'package:avtovas_mobile/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BusRoutesCardLocationsText extends StatelessWidget {
  const BusRoutesCardLocationsText({
    super.key,
    required this.departure_city,
    required this.arrival_city,
  });

  final String departure_city;
  final String arrival_city;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$departure_city - $arrival_city',
      style: const TextStyle(
        fontSize: 25,
        height: 1.2,
        fontWeight: FontWeight.w700,
        fontFamily: 'PTSans-Regular',
        color: AppColors.green,
      ),
    );
  }
}