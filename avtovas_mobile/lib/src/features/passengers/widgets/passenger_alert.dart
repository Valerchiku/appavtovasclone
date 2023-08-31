import 'package:avtovas_mobile/src/features/main/cubit/profile_cubit/profile_cubit.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class PassengerAlert extends StatefulWidget {
  final PassengersCubit cubit;

  const PassengerAlert({
    required this.cubit,
    super.key,
  });

  @override
  State<PassengerAlert> createState() => _PassengerAlertState();
}

class _PassengerAlertState extends State<PassengerAlert> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassengersCubit, PassengersState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return AvtovasAlertDialog();
      },
    );
  }
}
