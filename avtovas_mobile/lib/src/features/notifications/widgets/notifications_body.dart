import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/features/notifications/cubit/notifications_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        final notificationsCubit = CubitScope.of<NotificationsCubit>(context);
        return Padding(
          padding: const EdgeInsets.all(
            AppDimensions.large,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.locale.sendPushNotificationsBeforeRace,
                style: context.themeData.textTheme.titleLarge,
              ),
              CupertinoSwitch(
                activeColor: context.theme.mainAppColor,
                value: notificationsCubit.state.showNotifications,
                onChanged: (value) {
                  notificationsCubit.toggleNotifications(value: value);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
