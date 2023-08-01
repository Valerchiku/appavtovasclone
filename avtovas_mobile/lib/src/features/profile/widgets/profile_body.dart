import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/features/profile/cubit/profile_cubit.dart';
import 'package:avtovas_mobile/src/features/profile/widgets/profile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final profileCubit = CubitScope.of<ProfileCubit>(context);

        return CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const SizedBox(height: AppDimensions.medium),
                  ProfileButton(
                    onTap: () {},
                    buttonText: 'Мои поездки',
                    svgPath: AppAssets.tripsIcon,
                  ),
                  ProfileButton(
                    onTap: () {},
                    buttonText: 'Пассажиры',
                    svgPath: AppAssets.supportIcon,
                  ),
                  ProfileButton(
                    onTap: () {},
                    buttonText: 'История платежей',
                    svgPath: AppAssets.supportIcon,
                  ),
                  ProfileButton(
                    onTap: () {},
                    buttonText: 'Уведомления',
                    svgPath: AppAssets.supportIcon,
                  ),
                  ProfileButton(
                    onTap: () {},
                    buttonText: 'Справочная информация',
                    svgPath: AppAssets.supportIcon,
                  ),
                  ProfileButton(
                    onTap: () {},
                    buttonText: 'Положения и условия',
                    svgPath: AppAssets.supportIcon,
                  ),
                  ProfileButton(
                    onTap: () {},
                    buttonText: 'О приложении',
                    svgPath: AppAssets.tripsIcon,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
