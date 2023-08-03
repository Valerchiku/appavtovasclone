// ignore_for_file: implementation_imports,
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/src/widgets/avtovas_passengers_item/passengers_item.dart';

final class PassengersScreenBody extends StatefulWidget {
  const PassengersScreenBody({super.key});

  @override
  State<PassengersScreenBody> createState() => _PassengersScreenBodyState();
}

class _PassengersScreenBodyState extends State<PassengersScreenBody> {
  final _passengersCubit = i.get<PassengersCubit>();

  @override
  void initState() {
    _passengersCubit.setPassengers(Mocks.passengers);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassengersCubit, PassengersState>(
        builder: (context, state) {
      return ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.large,
        ),
        children: [
          for (MockPassenger passenger in _passengersCubit.state.passengers)
            PassengersItem(
              name: passenger.fullName,
              age: '3',
              gender: 'a',
              onSelected: () {},
            ),
        ],
      );
    },);
  }
}
