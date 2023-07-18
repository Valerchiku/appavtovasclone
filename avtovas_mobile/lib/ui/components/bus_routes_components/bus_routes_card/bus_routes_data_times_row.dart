import 'package:avtovas_mobile/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BusRoutesCardDateTimesRow extends StatelessWidget {
  const BusRoutesCardDateTimesRow({
    super.key,
    required this.deviceSize,
    required this.departure_date,
    required this.departure_time,
    required this.travel_time,
    required this.arrival_time,
    required this.arrival_date,
  });

  final Size deviceSize;
  final String departure_date;
  final String departure_time;
  final String travel_time;
  final String arrival_time;
  final String arrival_date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceSize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 25,
            width: deviceSize.width / 7,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Text(
                departure_date,
                style: const TextStyle(
                  fontSize: 12,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'PTSans-Regular',
                  color: AppColors.semiDarkGrey,
                ),
              ),
            ),
          ),
          Text(
            departure_time,
            style: const TextStyle(
              fontSize: 17,
              height: 1.19,
              color: AppColors.green,
              fontFamily: 'PTSans-Regular',
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            height: 60,
            width: deviceSize.width / 4,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  width: deviceSize.width / 4,
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      travel_time,
                      style: const TextStyle(
                        color: AppColors.semiDarkGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'PTSans-Regular',
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: deviceSize.width,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: AppColors.green,
                                width: 2,
                              ),
                            ),
                          ),
                          Container(
                            height: 3,
                            width: deviceSize.width / 7,
                            color: AppColors.green,
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: AppColors.green,
                                width: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            arrival_time,
            style: const TextStyle(
              fontSize: 17,
              height: 1.19,
              color: AppColors.green,
              fontFamily: 'PTSans-Regular',
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            height: 25,
            width: deviceSize.width / 7,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: Text(
                arrival_date,
                style: const TextStyle(
                  fontSize: 12,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'PTSans-Regular',
                  color: AppColors.semiDarkGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}