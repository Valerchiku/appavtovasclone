import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/return_conditions_page/cubit/return_conditions_cubit.dart';
import 'package:avtovas_mobile/src/features/return_conditions_page/widgets/return_conditions_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnConditionsPage extends StatelessWidget {
  const ReturnConditionsPage({super.key});

  void _listener(BuildContext context, ReturnConditionsState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(ReturnConditionsState prev, ReturnConditionsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<ReturnConditionsCubit>(
      child: BlocConsumer<ReturnConditionsCubit, ReturnConditionsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          // ignore: unused_local_variable
          final cubit = CubitScope.of<ReturnConditionsCubit>(context);
          return BaseNavigationPage(
            appBarTitle: context.locale.returnConditions,
            leadingSvgPath: AppAssets.backArrowIcon,
            onLeadingTap: cubit.onBackButtonTap,
            onNavigationItemTap: cubit.onNavigationItemTap,
            body: const ReturnConditionsBody(),
          );
        },
      ),
    );
  }
}
