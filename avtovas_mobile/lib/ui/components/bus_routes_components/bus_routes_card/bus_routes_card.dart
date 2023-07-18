import 'package:avtovas_mobile/ui/components/bus_routes_components/bus_routes_card/bus_routes_data_times_row.dart';
import 'package:avtovas_mobile/ui/components/bus_routes_components/bus_routes_card/bus_routes_footer.dart';
import 'package:avtovas_mobile/ui/components/bus_routes_components/bus_routes_card/bus_routes_header.dart';
import 'package:avtovas_mobile/ui/components/bus_routes_components/bus_routes_card/bus_routes_locations_text.dart';
import 'package:avtovas_mobile/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BusRoutesCard extends StatelessWidget {
  const BusRoutesCard({
    super.key,
    required this.deviceSize,
    required this.route_number,
    required this.railway_station_departure,
    required this.railway_station_arrival,
    required this.departure_city,
    required this.arrival_city,
    required this.departure_date,
    required this.departure_time,
    required this.travel_time,
    required this.arrival_date,
    required this.arrival_time,
    required this.price,
    required this.available_seats,
    required this.buy_ticket,
  });

  final Size deviceSize;
  final String route_number;
  final String railway_station_departure;
  final String railway_station_arrival;
  final String departure_city;
  final String arrival_city;
  final String departure_date;
  final String departure_time;
  final String travel_time;
  final String arrival_date;
  final String arrival_time;
  final String price;
  final String available_seats;
  final Function() buy_ticket;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceSize.height < 800
          ? deviceSize.height / 2.8
          : deviceSize.height / 3.3,
      width: deviceSize.width,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BusRoutesCardHeader(
              route_number: route_number,
              railway_station_departure: railway_station_departure,
              railway_station_arrival: railway_station_arrival,
            ),
            BusRoutesCardLocationsText(
              departure_city: departure_city,
              arrival_city: arrival_city,
            ),
            BusRoutesCardDateTimesRow(
              deviceSize: deviceSize,
              departure_date: departure_date,
              departure_time: departure_time,
              travel_time: travel_time,
              arrival_time: arrival_time,
              arrival_date: arrival_date,
            ),
            BusRoutesCardFooter(
              price: price,
              available_seats: available_seats,
              buy_ticket: buy_ticket,
            ),
          ],
        ),
      ),
    );
  }
}
