import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passengers_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassengersPage extends StatelessWidget {
  const PassengersPage({super.key});

  bool _listenWhen(PassengersState prev, PassengersState current) {
    return prev.route.type == null && current.route.type != null;
  }

  void _listener(BuildContext context, PassengersState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<PassengersCubit>(
      child: BlocConsumer<PassengersCubit, PassengersState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<PassengersCubit>(context);

          return BaseNavigationPage(
            appBarTitle: context.locale.passengersTitle,
            leadingSvgPath: AppAssets.backArrowIcon,
            onLeadingTap: cubit.onBackButtonTap,
            onNavigationItemTap: cubit.onNavigationItemTap,
            body: const PassengersBody(),
          );
        },
      ),
    );
  }
}
