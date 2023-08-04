import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/profile/cubit/profile_cubit.dart';
import 'package:avtovas_mobile/src/features/profile/widgets/profile_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<ProfileCubit>(
      child: BaseNavigationPage(
        appBarTitle: context.locale.profile,
        body: const ProfileBody(),
      ),
    );
  }
}
