import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/ticketing/cubit/ticketing_cubit.dart';
import 'package:avtovas_web/src/features/ticketing/widgets/ticketing_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TicketingPage extends StatelessWidget {
  final SingleTrip trip;

  const TicketingPage({
    required this.trip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CubitScope<TicketingCubit>(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cubit = CubitScope.of<TicketingCubit>(context);

          final isSmart = constraints.maxWidth <= 100;

          return BasePage(
            isSmart: isSmart,
            body: SizedBox(
              height: 300,
              child: TicketingBody(
                cubit: cubit,
                trip: trip,
              ),
            ),
          );
        },
      ),
    );
  }
}

final class TicketingArguments extends PageArguments {
  final SingleTrip trip;

  @override
  List<Object?> get props => [
        trip,
      ];

  TicketingArguments({
    required this.trip,
  });
}
