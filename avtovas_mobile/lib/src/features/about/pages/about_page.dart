import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/about/cubit/about_cubit.dart';
import 'package:avtovas_mobile/src/features/about/widgets/about_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    super.key,
  });

  void _listener(BuildContext context, AboutState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(AboutState prev, AboutState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AboutCubit>(
        child: BlocConsumer<AboutCubit, AboutState>(
            listener: _listener,
            listenWhen: _listenWhen,
            builder: (context, state) {
              final cubit = CubitScope.of<AboutCubit>(context);

              return BaseNavigationPage(
                appBarTitle: context.locale.about,
                leadingSvgPath: AppAssets.backArrowIcon,
                onLeadingTap: cubit.onBackButtonTap,
                onNavigationItemTap: cubit.onNavigationItemTap,
                body: const AboutBody(),
              );
            },),);
  }
}
