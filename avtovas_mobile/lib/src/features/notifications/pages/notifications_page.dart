import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/notifications/cubit/notifications_cubit.dart';
import 'package:avtovas_mobile/src/features/notifications/widgets/notifications_body.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({
    super.key,
  });

  void _listener(BuildContext context, NotificationsState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(NotificationsState prev, NotificationsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<NotificationsCubit>(
      child: BlocConsumer<NotificationsCubit, NotificationsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<NotificationsCubit>(context);

          return BaseNavigationPage(
            appBarTitle: context.locale.notifications,
            leadingSvgPath: AppAssets.backArrowIcon,
            onLeadingTap: cubit.onBackButtonTap,
            onNavigationItemTap: cubit.onNavigationItemTap,
            body: const NotificationsBody(),
          );
        },
      ),
    );
  }
}
