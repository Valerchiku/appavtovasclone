import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/alert_statuses.dart';
import 'package:avtovas_mobile/src/features/main/cubit/profile_cubit/profile_cubit.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_mobile/src/features/passengers/utils/alert_types.dart';
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
        return Container(
          width: context.availableWidth,
          height: context.availableHeight,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.7),
          ),
          child: AvtovasAlertDialog(
            okayCallback: switch (state.alertType) {
              PassengerAlertTypes.add => widget.cubit.addPassenger,
              PassengerAlertTypes.save => widget.cubit.updatePassenger,
              PassengerAlertTypes.delete => widget.cubit.removePassenger,
            },
            cancelCallback: widget.cubit.closeAlert,
            title: switch (widget.cubit.state.alertType) {
              PassengerAlertTypes.delete =>
                context.locale.confirmPassengerDeletion,
              PassengerAlertTypes.add => context.locale.addPassenger,
              PassengerAlertTypes.save => context.locale.confirmPassengerChange,
            },
          ),
        );
      },
    );
  }
}
