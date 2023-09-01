import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class PassengersList extends StatelessWidget {
  final PassengersCubit cubit;
  final ValueChanged<Passenger> onPassengerTap;
  final VoidCallback onAddPassengerTap;

  const PassengersList({
    required this.cubit,
    required this.onPassengerTap,
    required this.onAddPassengerTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassengersCubit, PassengersState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state.passengers == null) ...[
              const Spacer(),
              const Text('Вы ещё не добавили ни одного пассажира!'),
            ] else
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.large,
                    vertical: AppDimensions.medium,
                  ),
                  separatorBuilder: (_, __) {
                    return Divider(
                      color: context.theme.dividerColor,
                      thickness: AppDimensions.dividerThickness,
                    );
                  },
                  itemCount: state.passengers!.length,
                  itemBuilder: (_, index) {
                    final passenger = state.passengers![index];

                    return PassengerItem(
                      onTap: () => onPassengerTap(passenger),
                      passengerFirstName: passenger.firstName,
                      passengerLastName: passenger.lastName,
                      passengerSurname: passenger.surname,
                      passengerGender: passenger.gender,
                      passengerBirthday:
                          passenger.birthdayDate.requestDateFormat(),
                    );
                  },
                ),
              ),
            const Spacer(),
            AvtovasButton.icon(
              buttonText: context.locale.addPassenger,
              svgPath: AppAssets.passengerIcon,
              margin: const EdgeInsets.all(AppDimensions.medium),
              padding: const EdgeInsets.all(AppDimensions.mediumLarge),
              mainAxisAlignment: MainAxisAlignment.center,
              borderColor: context.theme.mainAppColor,
              buttonColor: context.theme.transparent,
              backgroundOpacity: 0,
              textStyle: context.themeData.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.normal,
                color: context.theme.primaryTextColor,
              ),
              onTap: onAddPassengerTap,
            ),
          ],
        );
      },
    );
  }
}
