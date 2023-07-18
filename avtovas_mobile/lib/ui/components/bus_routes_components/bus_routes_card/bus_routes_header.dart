import 'package:avtovas_mobile/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusRoutesCardHeader extends StatelessWidget {
  const BusRoutesCardHeader({
    super.key,
    required this.route_number,
    required this.railway_station_departure,
    required this.railway_station_arrival,
  });

  final String route_number;
  final String railway_station_departure;
  final String railway_station_arrival;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: SvgPicture.asset(
        'asset/icons/bus_icon.svg',
        height: 40,
        width: 40,
        fit: BoxFit.cover,
      ),
      title: Text(
        route_number,
        style: const TextStyle(
          color: AppColors.darkGrey,
          fontSize: 14,
          fontFamily: 'PTSans-Regular',
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Row(
        children: [
          const Text(
            '◉',
            style: TextStyle(
              color: AppColors.green,
              fontSize: 11,
              fontWeight: FontWeight.w400,
              fontFamily: 'PTSans-Regular',
            ),
          ),
          Text(
            '$railway_station_departure — $railway_station_arrival',
            style: const TextStyle(
              color: AppColors.darkGrey,
              fontSize: 11,
              fontFamily: 'PTSans-Regular',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}