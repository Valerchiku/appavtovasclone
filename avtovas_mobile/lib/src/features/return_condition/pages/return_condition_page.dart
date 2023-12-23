import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/return_condition/cubit/return_condition_cubit.dart';
import 'package:avtovas_mobile/src/features/return_condition/widget/return_condition_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnConditionPage extends StatelessWidget {
  const ReturnConditionPage({super.key});

  void _listener(BuildContext context, ReturnConditionState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(ReturnConditionState prev, ReturnConditionState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<ReturnConditionCubit>(
      child: BlocConsumer<ReturnConditionCubit, ReturnConditionState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<ReturnConditionCubit>(context);

          return BaseNavigationPage(
            appBarTitle: context.locale.returnConditions,
            leadingSvgPath: AppAssets.backArrowIcon,
            onLeadingTap: cubit.onBackButtonTap,
            onNavigationItemTap: cubit.onNavigationItemTap,
            body: const ReturnConditionBody(),
          );
        },
      ),
    );
  }
}
