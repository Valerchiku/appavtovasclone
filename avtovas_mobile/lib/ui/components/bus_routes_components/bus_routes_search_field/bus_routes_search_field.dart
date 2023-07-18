import 'package:avtovas_mobile/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusRoutesSearchField extends StatelessWidget {
  final Size deviceSize;
  final String departure_city;
  final String arrival_city;
  final List<String> routes;
  final Function(String?)? departureOnChanged;
  final Function(String?)? arrivalOnChanged;
  final Function() swapDropdownValues;

  const BusRoutesSearchField({
    super.key,
    required this.deviceSize,
    required this.departure_city,
    required this.arrival_city,
    required this.routes,
    required this.departureOnChanged,
    required this.arrivalOnChanged,
    required this.swapDropdownValues,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceSize.height < 800
          ? deviceSize.height / 4.7 + 16
          : deviceSize.height / 4.7,
      width: deviceSize.width,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: deviceSize.height / 20,
                width: deviceSize.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton(
                    value: departure_city,
                    isExpanded: true,
                    dropdownColor: AppColors.white,
                    icon: Container(),
                    underline: Container(),
                    style: const TextStyle(
                      fontFamily: 'PTSans-Regular',
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.29,
                    ),
                    items: routes.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: departureOnChanged,
                  ),
                ),
              ),
            ),
            Positioned(
              top: deviceSize.height / 20 + 16,
              child: Container(
                height: deviceSize.height / 20,
                width: deviceSize.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton(
                    value: arrival_city,
                    isExpanded: true,
                    dropdownColor: AppColors.white,
                    icon: Container(),
                    underline: Container(),
                    style: const TextStyle(
                      fontFamily: 'PTSans-Regular',
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.29,
                    ),
                    items: routes.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: arrivalOnChanged,
                  ),
                ),
              ),
            ),
            Positioned(
              left: deviceSize.width - (16 * 7),
              top: deviceSize.height / 35,
              child: FloatingActionButton.small(
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.green,
                onPressed: swapDropdownValues,
                child: SvgPicture.asset('asset/icons/swap.svg'),
              ),
            ),
            Positioned(
              top: deviceSize.height / 20 + (16 * 4.5),
              child: Row(
                children: [
                  Container(
                    height: deviceSize.height / 25,
                    width: deviceSize.width / 4,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        '19 июл, ср',
                        style: TextStyle(
                          fontFamily: 'PTSans-Regular',
                          fontWeight: FontWeight.w400,
                          height: 1.29,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    height: deviceSize.height / 25,
                    width: deviceSize.width / 4,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('asset/icons/tic.svg'),
                          const Text(
                            'Фильтры',
                            style: TextStyle(
                              fontFamily: 'PTSans-Regular',
                              fontWeight: FontWeight.w400,
                              height: 1.29,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
