import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

final class PassengerSelectorSheet extends StatelessWidget {
  final List<Passenger>? existentPassengers;
  final ValueChanged<Passenger> onPassengerChanged;

  const PassengerSelectorSheet({
    required this.existentPassengers,
    required this.onPassengerChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return existentPassengers == null
        ? SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: const Center(
              child: Text(
                'Вы пока не добавили ни одного пассажира',
                textAlign: TextAlign.center,
              ),
            ),
          )
        : SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: ListView.separated(
              itemCount: existentPassengers!.length,
              separatorBuilder: (_, __) {
                return const Divider(
                  thickness: AppDimensions.dividerThickness,
                );
              },
              itemBuilder: (_, index) {
                final passenger = existentPassengers![index];

                return PassengerItem(
                  onTap: () {
                    onPassengerChanged(passenger);
                    Navigator.pop(context);
                  },
                  passengerFirstName: passenger.firstName,
                  passengerLastName: passenger.lastName,
                  passengerSurname: passenger.surname,
                  passengerGender: passenger.gender,
                  passengerBirthday: passenger.birthdayDate.requestDateFormat(),
                );
              },
            ),
          );
  }
}
