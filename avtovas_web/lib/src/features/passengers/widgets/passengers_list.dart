import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class PassengersList extends StatelessWidget {
  final PassengersCubit cubit;
  final ValueChanged<Passenger> onPassengerTap;

  const PassengersList({
    required this.cubit,
    required this.onPassengerTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassengersCubit, PassengersState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state.passengers == null) ...[
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.3),
              const Text('Вы ещё не добавили ни одного пассажира!'),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.3),
            ] else
              for (final passenger in state.passengers!)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.large,
                    vertical: AppDimensions.medium,
                  ),
                  child: PassengerItem(
                    onTap: () => onPassengerTap(passenger),
                    passengerFirstName: passenger.firstName,
                    passengerLastName: passenger.lastName,
                    passengerSurname: passenger.surname,
                    passengerGender: passenger.gender,
                    passengerBirthday:
                        passenger.birthdayDate.requestDateFormat(),
                  ),
                ),
          ],
        );
      },
    );
  }
}
