import 'package:avtovas_mobile/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusRoutesSortByField extends StatelessWidget {
  final Size deviceSize;
  final String sortByValue;
  final List<String> sortBy;
  final Function(String?)? sortOnChanged;
  const BusRoutesSortByField({
    super.key,
    required this.deviceSize,
    required this.sortByValue,
    required this.sortBy,
    required this.sortOnChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceSize.height / 20,
      width: deviceSize.width,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DropdownButton(
          value: sortByValue,
          style: const TextStyle(
            fontFamily: 'PTSans-Regular',
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.29,
          ),
          isExpanded: true,
          dropdownColor: AppColors.white,
          icon: SvgPicture.asset('asset/icons/arrow_down.svg'),
          underline: Container(),
          items: sortBy.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: sortOnChanged,
        ),
      ),
    );
  }
}
