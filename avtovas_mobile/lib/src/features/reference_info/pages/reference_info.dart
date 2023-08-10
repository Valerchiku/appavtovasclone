// ignore: implementation_imports
import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/reference_info/cubit/refernce_info_cubit.dart';
import 'package:avtovas_mobile/src/features/reference_info/widgets/reference_info_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReferencePageInfoPage extends StatelessWidget {
  const ReferencePageInfoPage({super.key});

  void _listener(BuildContext context, RefereceInfoState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(RefereceInfoState prev, RefereceInfoState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<RefereceInfoCubit>(
        child: BlocConsumer<RefereceInfoCubit, RefereceInfoState>(
          listener: _listener,
          listenWhen: _listenWhen,
          builder: (context, state) {
            final cubit = CubitScope.of<RefereceInfoCubit>(context);

            return BaseNavigationPage(
              appBarTitle: context.locale.help,
              leadingSvgPath: AppAssets.backArrowIcon,
              onLeadingTap: cubit.onBackButtonTap,
              onNavigationItemTap: cubit.onNavigationItemTap,
              body: const ReferenceInfoPageBody(),
            );
          },
        ),
    );
  }
}
