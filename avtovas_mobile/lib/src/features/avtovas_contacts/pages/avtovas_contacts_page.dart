import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/avtovas_contacts/cubit/avtovas_contacts_cubit.dart';
import 'package:avtovas_mobile/src/features/avtovas_contacts/widgets/avtovas_contacts_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvtovasContactsPage extends StatelessWidget {
  const AvtovasContactsPage({super.key});

  void _listener(BuildContext context, AvtovasContactsState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(AvtovasContactsState prev, AvtovasContactsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AvtovasContactsCubit>(
      child: BlocConsumer<AvtovasContactsCubit, AvtovasContactsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, _) {
          final cubit = CubitScope.of<AvtovasContactsCubit>(context);

          return BaseNavigationPage(
            appBarTitle: context.locale.call,
            leadingSvgPath: AppAssets.backArrowIcon,
            onLeadingTap: cubit.onBackButtonTap,
            onNavigationItemTap: cubit.onNavigationItemTap,
            body: AvtovasContactsBody(cubit: cubit),
          );
        },
      ),
    );
  }
}
