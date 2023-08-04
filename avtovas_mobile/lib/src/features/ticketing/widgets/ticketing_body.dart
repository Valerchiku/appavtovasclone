import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/features/ticketing/cubit/ticketing_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TicketingBody extends StatelessWidget {
  const TicketingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketingCubit, TicketingState>(
      builder: (context, state) {
        final cubit = CubitScope.of<TicketingCubit>(context);

        return ListView(
          padding: const EdgeInsets.all(AppDimensions.large),
          children: [
            const TicketingHeader(
              departurePlace: 'Алатырь',
              arrivalPlace: 'Ардатов',
              tripDateTime: '14 июля в 21:40',
              tripPrice: '1200,00 руб.',
            ),
            const SizedBox(height: AppDimensions.large),
            PassengerCollapsedContainer(
              onGenderChanged: cubit.onGenderChanged,
              onSurnameVisibleChanged: (value) {
                if (value != null) {
                  cubit.changeSurnameVisibility(withoutSurname: value);
                }
              },
              selectedGender: state.currentGender,
              isSurnameVisible: state.withoutSurname,
            ),

          ],
        );
      },
    );
  }
}
