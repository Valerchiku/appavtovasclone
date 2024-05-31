import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/app_configuration_cubit.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:avtovas_mobile/src/features/main/cubit/profile_cubit/profile_cubit.dart';
import 'package:avtovas_mobile/src/features/main/widgets/profile_widgets/profile_button.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

final class ProfileBody extends StatefulWidget {
  final EdgeInsets viewInsets;

  const ProfileBody({
    required this.viewInsets,
    super.key,
  });

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  bool _listenWhen(ProfileState prev, ProfileState current) {
    return prev.route.type == null && current.route.type != null;
  }

  void _listener(ProfileState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  Future<void> _scrollToMaxExtent() {
    return _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 150),
      curve: Curves.linearToEaseOut,
    );
  }

  Future<void> _showDialog(BuildContext context, VoidCallback onExit) async {
    SupportMethods.showAvtovasDialog(
      context: context,
      builder: (context) {
        return AvtovasAlertDialog(
          title: context.locale.exitWarning,
          okayCallback: () {
            onExit();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, keyboardWasOpened) {
        if (keyboardWasOpened) _scrollToMaxExtent();

        return CubitScope<ProfileCubit>(
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (_, state) => _listener(state),
            listenWhen: _listenWhen,
            builder: (context, state) {
              final cubit = CubitScope.of<ProfileCubit>(context);

              return Stack(
                children: [
                  ListView(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    children: [
                      if (state.isAuthorized == null)
                        const SizedBox()
                      else
                        _ProfileWidgets(
                          onPassengersTap: cubit.onPassengersButtonTap,
                          onPaymentsHistoryTap:
                              cubit.onPaymentsHistoryButtonTap,
                          onNotificationsTap: cubit.onNotificationsButtonTap,
                          onReferenceInfoTap: cubit.onReferenseInfoButtonTap,
                          onPolicyTextTap: cubit.navigateToPolicy,
                          onAboutTap: cubit.onAboutButtonTap,
                          onTermsTap: cubit.navigateToTerms,
                          onPhoneChanged: cubit.onAuthorizationNumberChanged,
                          onSendButtonTap: cubit.onSendButtonTap,
                          onTextTap: cubit.onTextTap,
                          state: state,
                        ),
                    ],
                  ),
                  if (state.isAuthorized != null && state.isAuthorized!)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AvtovasButton.text(
                            buttonText: context.locale.exit,
                            onTap: () => _showDialog(context, cubit.onExitTap),
                            margin: const EdgeInsets.all(AppDimensions.large),
                            padding: const EdgeInsets.all(
                              AppDimensions.mediumLarge,
                            ),
                            buttonColor: context.theme.transparent,
                            borderColor: context.theme.mainAppColor,
                            backgroundOpacity: 0,
                            textStyle: context.themeData.textTheme.titleLarge
                                ?.copyWith(
                              fontSize: AppFonts.sizeHeadlineMedium,
                              color: context.theme.mainAppColor,
                            ),
                          ),
                          if (AvtovasPlatform.isIOS) ...[
                            AvtovasButton.text(
                              buttonText: 'Удалить учетную запись',
                              onTap: () => _showDeleteAccountDialog(
                                context,
                                () => cubit.onAccountDeleteTap().whenComplete(
                                      () => _showDeleteAccountInfoDialog(
                                        context,
                                      ),
                                    ),
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: AppDimensions.large,
                              ),
                              padding: const EdgeInsets.all(
                                AppDimensions.mediumLarge,
                              ),
                              buttonColor: context.theme.transparent,
                              borderColor: context.theme.transparent,
                              backgroundOpacity: 0,
                              textStyle: context.themeData.textTheme.titleLarge
                                  ?.copyWith(
                                fontSize: AppFonts.sizeHeadlineMedium,
                                color: context.theme.mainAppColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: state.pageLoading
                        ? SizedBox(
                            width: context.availableWidth,
                            height: context.availableHeight,
                            child: const ColoredBox(
                              color: Colors.black38,
                              child: CupertinoActivityIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : null,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _showDeleteAccountInfoDialog(BuildContext context) {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (_) {
        return const AvtovasAlertDialog(
          title: 'Все данные о Вашей учетной записи были успешно удалены',
          withCancel: false,
        );
      },
    );
  }

  Future<void> _showDeleteAccountDialog(
    BuildContext context,
    AsyncCallback onDelete,
  ) {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (_) {
        return AvtovasAlertDialog(
          title: 'Вы уверены, что хотите удалить свою учетную запись?\n'
              'Данное действие приведет к полному удалению данных о Вашей '
              'учетной записи, их востановление может вызвать трудности',
          okayCallback: onDelete,
        );
      },
    );
  }
}

final class _ProfileWidgets extends StatelessWidget {
  final VoidCallback onPassengersTap;
  final VoidCallback onPaymentsHistoryTap;
  final VoidCallback onNotificationsTap;
  final VoidCallback onReferenceInfoTap;
  final VoidCallback onPolicyTextTap;
  final VoidCallback onTermsTap;
  final VoidCallback onAboutTap;
  final ValueChanged<String> onPhoneChanged;
  final VoidCallback onSendButtonTap;
  final VoidCallback onTextTap;
  final ProfileState state;

  const _ProfileWidgets({
    required this.onPassengersTap,
    required this.onPaymentsHistoryTap,
    required this.onNotificationsTap,
    required this.onReferenceInfoTap,
    required this.onPolicyTextTap,
    required this.onTermsTap,
    required this.onAboutTap,
    required this.onPhoneChanged,
    required this.onSendButtonTap,
    required this.onTextTap,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppDimensions.medium),
        ProfileButton(
          onTap: () => CubitScope.of<AppConfigurationCubit>(context)
              .updateNavigationIndex(1),
          buttonText: context.locale.myTrips,
          svgPath: AppAssets.tripsIcon,
        ),
        ProfileButton(
          onTap: onPassengersTap,
          buttonText: context.locale.passenger,
          svgPath: AppAssets.passengerIcon,
        ),
        ProfileButton(
          onTap: onPaymentsHistoryTap,
          buttonText: context.locale.paymentHistory,
          svgPath: AppAssets.paymentHistoryIcon,
        ),
        ProfileButton(
          onTap: onNotificationsTap,
          buttonText: context.locale.notifications,
          svgPath: AppAssets.notificationsIcon,
        ),
        ProfileButton(
          onTap: onReferenceInfoTap,
          buttonText: context.locale.referenceInformation,
          svgPath: AppAssets.infoIcon,
        ),
        ProfileButton(
          onTap: onTermsTap,
          buttonText: context.locale.termAndConditions,
          svgPath: AppAssets.listIcon,
        ),
        ProfileButton(
          onTap: onAboutTap,
          buttonText: context.locale.aboutApp,
          svgPath: AppAssets.microBusIcon,
        ),
        if (!state.isAuthorized!) ...[
          const SizedBox(height: AppDimensions.large),
          AuthorizationPhoneContainer(
            onNumberChanged: onPhoneChanged,
            onSendButtonTap: onSendButtonTap,
            onTextTap: onTextTap,
            onTermsTap: onTermsTap,
            number: state.authorizationNumber ?? '',
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
