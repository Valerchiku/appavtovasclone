import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/bus_station_contacts/cubit/bus_station_contacts_cubit.dart';
import 'package:avtovas_mobile/src/features/bus_station_contacts/widgets/bus_station_contacts_body.dart';
import 'package:common/avtovas_common.dart';
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
      BusStationContactsState prev, BusStationContactsState current,) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<BusStationContactsCubit>(
        child: BlocConsumer<BusStationContactsCubit, BusStationContactsState>(
            listener: _listener,
            listenWhen: _listenWhen,
            builder: (context, state) {
              final cubit = CubitScope.of<BusStationContactsCubit>(context);

              return BaseNavigationPage(
                appBarTitle: context.locale.contactsTitle,
                leadingSvgPath: AppAssets.backArrowIcon,
                onLeadingTap: cubit.onBackButtonTap,
                onNavigationItemTap: cubit.onNavigationItemTap,
                body: const BusStationContactsPageBody(
                  contacts: [],
                ),
              );
            },),);
  }
}
