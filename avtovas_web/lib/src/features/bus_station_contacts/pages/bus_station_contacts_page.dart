import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/bus_station_contacts/cubit/bus_station_contacts_cubit.dart';
import 'package:avtovas_web/src/features/bus_station_contacts/widgets/bus_station_contacts_body.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusStationContactsPage extends StatelessWidget {
  const BusStationContactsPage({super.key});

  void _listener(BuildContext context, BusStationContactsState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(
    BusStationContactsState prev,
    BusStationContactsState current,
  ) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<BusStationContactsCubit>(
      child: BlocConsumer<BusStationContactsCubit, BusStationContactsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          // ignore: unused_local_variable
          final cubit = CubitScope.of<BusStationContactsCubit>(context);

          return BasePageBuilder(
            hasScrollBody: false,
            layoutBuilder: (smartLayout, mobileLayout) {
              return BusStationContactsBody(
                smartLayout: smartLayout,
                mobileLayout: mobileLayout,
                contacts: const [],
              );
            },
          );
        },
      ),
    );
  }
}
