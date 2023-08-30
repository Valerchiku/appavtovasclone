import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passenger_container.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class PassengersBody extends StatelessWidget {
  const PassengersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassengersCubit, PassengersState>(
      builder: (context, state) {
        final cubit = CubitScope.of<PassengersCubit>(context);

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
                      onTap: () => cubit
                        ..setExistentPassenger(passenger)
                        ..openBottomSheet(newPassenger: false),
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
              onTap: () => cubit.openBottomSheet(newPassenger: true),
            ),
          ],
        );
      },
    );
  }
}
