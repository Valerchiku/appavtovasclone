import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_shimmer/base_shimmer.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:avtovas_mobile/src/features/profile/cubit/profile_cubit.dart';
import 'package:avtovas_mobile/src/features/profile/widgets/profile_button.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = CubitScope.of<ProfileCubit>(context);

        return CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: state.isAuthorized == null
                  ? const _ShimmerProfileWidgets()
                  : _ProfileWidgets(cubit: cubit, state: state),
            ),
          ],
        );
      },
    );
  }
}

final class _ProfileWidgets extends StatelessWidget {
  final ProfileCubit cubit;
  final ProfileState state;

  const _ProfileWidgets({
    required this.cubit,
    required this.state,
  });

  Future<void> _showDialog(BuildContext context, VoidCallback onExit) async {
    SupportMethods.showAvtovasDialog(
      context: context,
      showWindow: () => showDialog(
        context: context,
        builder: (context) {
          return AvtovasAlertDialog(
            title: context.locale.exitWarning,
            okayCallback: () {
              Navigator.pop(context);
              onExit();
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppDimensions.medium),
        ProfileButton(
          onTap: () {},
          buttonText: context.locale.myTrips,
          svgPath: AppAssets.tripsIcon,
        ),
        ProfileButton(
          onTap: () {},
          buttonText: context.locale.passenger,
          svgPath: AppAssets.passengerIcon,
        ),
        ProfileButton(
          onTap: () {},
          buttonText: context.locale.paymentHistory,
          svgPath: AppAssets.paymentHistoryIcon,
        ),
        ProfileButton(
          onTap: () {},
          buttonText: context.locale.notifications,
          svgPath: AppAssets.notificationsIcon,
        ),
        ProfileButton(
          onTap: () {},
          buttonText: context.locale.referenceInformation,
          svgPath: AppAssets.infoIcon,
        ),
        ProfileButton(
          onTap: () {},
          buttonText: context.locale.termAndConditions,
          svgPath: AppAssets.listIcon,
        ),
        ProfileButton(
          onTap: () {},
          buttonText: context.locale.termAndConditions,
          svgPath: AppAssets.microBusIcon,
        ),
        if (state.isAuthorized!) ...[
          const Spacer(),
          AvtovasButton.text(
            buttonText: context.locale.exit,
            onTap: () => _showDialog(context, cubit.onExitTap),
            margin: const EdgeInsets.all(AppDimensions.large),
            padding: const EdgeInsets.all(AppDimensions.mediumLarge),
            buttonColor: context.theme.transparent,
            borderColor: context.theme.mainAppColor,
            backgroundOpacity: 0,
            textStyle: context.themeData.textTheme.titleLarge?.copyWith(
              fontSize: AppFonts.sizeHeadlineMedium,
              color: context.theme.mainAppColor,
            ),
          ),
        ] else ...[
          const SizedBox(height: AppDimensions.large),
          AuthorizationPhoneContainer(
            onNumberChanged: cubit.onAuthorizationNumberChanged,
            onSendButtonTap: cubit.onSendButtonTap,
            onTextTap: cubit.onTextTap,
            number: '',
          ),
        ],
      ],
    );
  }
}

final class _ShimmerProfileWidgets extends StatelessWidget {
  const _ShimmerProfileWidgets();

  @override
  Widget build(BuildContext context) {
    const buttonsAmount = 7;
    const authorizationHeight = 400.0;

    return Column(
      children: [
        for (var i = 0; i < buttonsAmount; i++) const BaseShimmer(),
        const SizedBox(height: AppDimensions.large),
        const BaseShimmer(shimmerHeight: authorizationHeight),
      ],
    );
  }
}
