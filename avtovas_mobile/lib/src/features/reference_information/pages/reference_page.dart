import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/reference_information/cubit/reference_cubit.dart';
import 'package:avtovas_mobile/src/features/reference_information/widgets/reference_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReferencePage extends StatelessWidget {
  const ReferencePage({super.key});

  void _listener(BuildContext context, ReferenceState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(ReferenceState prev, ReferenceState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<ReferenceCubit>(
      child: BlocConsumer<ReferenceCubit, ReferenceState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, _) {
          final cubit = CubitScope.of<ReferenceCubit>(context);

          return BaseNavigationPage(
            appBarTitle: context.locale.call,
            leadingSvgPath: AppAssets.backArrowIcon,
            onLeadingTap: cubit.onBackButtonTap,
            onNavigationItemTap: cubit.onNavigationItemTap,
            body: const ReferenceBody(),
          );
        },
      ),
    );
  }
}
