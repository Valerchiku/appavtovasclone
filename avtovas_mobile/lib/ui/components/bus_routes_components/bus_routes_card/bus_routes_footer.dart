import 'package:avtovas_mobile/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BusRoutesCardFooter extends StatelessWidget {
  const BusRoutesCardFooter({
    super.key,
    required this.price,
    required this.available_seats,
    required this.buy_ticket,
  });

  final String price;
  final String available_seats;
  final Function() buy_ticket;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      title: Text(
        price,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          height: 1.2,
          color: AppColors.darkGrey,
          fontFamily: 'PTSans-Regular',
        ),
      ),
      subtitle: Row(
        children: [
          const Text(
            'Осталось мест: ',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.darkGrey,
              fontFamily: 'PTSans-Regular',
            ),
          ),
          Text(
            available_seats,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.green,
              fontFamily: 'PTSans-Regular',
            ),
          ),
        ],
      ),
      trailing: Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextButton(
          onPressed: buy_ticket,
          child: const Text(
            'Купить билет',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              height: 1.29,
              fontWeight: FontWeight.w400,
              fontFamily: 'PTSans-Regular',
            ),
          ),
        ),
      ),
    );
  }
}