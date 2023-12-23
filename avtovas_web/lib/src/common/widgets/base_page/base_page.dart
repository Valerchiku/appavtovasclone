import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/navigation/routes.dart';
import 'package:avtovas_web/src/common/shared_cubit/base_page_cubit/base_page_cubit.dart';
import 'package:avtovas_web/src/common/widgets/avtovas_app_bar/avtovas_app_bar.dart';
import 'package:avtovas_web/src/common/widgets/avtovas_footer/avtovas_footer.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

typedef FlexibleLayoutBuilder = Widget Function(
  // ignore: avoid_positional_boolean_parameters
  bool smartLayout,
  bool mobileLayout,
);

class BasePageBuilder extends StatefulWidget {
  final FlexibleLayoutBuilder layoutBuilder;
  final Widget? supportBottomWidget;
  final bool hasScrollBody;
  final bool needBottomSpacer;

  const BasePageBuilder({
    required this.layoutBuilder,
    this.supportBottomWidget,
    this.hasScrollBody = true,
    this.needBottomSpacer = true,
    super.key,
  });

  @override
  State<BasePageBuilder> createState() => _BasePageBuilderState();
}

class _BasePageBuilderState extends State<BasePageBuilder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _drawerController;
  late final Animation<double> _drawerAnimation;

  late final ScrollController _scrollController;

  var _hasDrawerOpen = false;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _drawerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..value = 0;

    _drawerAnimation = CurvedAnimation(
      parent: _drawerController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _scrollToFooter() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 800),
      curve: Curves.decelerate,
    );
  }

  void _openDrawer() {
    _drawerController.forward();
    setState(() => _hasDrawerOpen = true);
  }

  Future<void> _closeDrawer() async {
    if (_drawerAnimation.value == 0) return;

    setState(() => _hasDrawerOpen = false);
    await _drawerController.reverse();
  }

  @override
  void dispose() {
    _drawerController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).path ?? '';

    return BlocBuilder<BasePageCubit, BasePageState>(
      builder: (context, state) {
        final cubit = CubitScope.of<BasePageCubit>(context);
        final maxLayoutWidth = MediaQuery.sizeOf(context).width;
        final smartLayout = maxLayoutWidth <= AppDimensions.maxNonSmartWidth;
        final mobileLayout = maxLayoutWidth <= AppDimensions.maxMobileWidth;

        return Scaffold(
          body: Stack(
            alignment: Alignment.centerLeft,
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    leading: const SizedBox(),
                    pinned: true,
                    flexibleSpace: ColoredBox(
                      color: context.theme.whiteTextColor,
                      child: AvtovasAppBar(
                        currentRoute: currentRoute,
                        smartLayout: smartLayout,
                        onHelpTap: _scrollToFooter,
                        onMenuButtonTap: _openDrawer,
                        onAvtovasLogoTap: currentRoute != Routes.mainPath.name
                            ? cubit.navigateToMain
                            : null,
                        onSignInTap: state.isUserAuthorized
                            ? null
                            : cubit.navigateToAuthorization,
                        onMyTripsTap: cubit.navigateToMyTrips,
                      ),
                    ),
                  ),
                  if (widget.hasScrollBody)
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          widget.layoutBuilder(smartLayout, mobileLayout),
                          const SizedBox(height: AppDimensions.medium),
                          AvtovasFooter(smartLayout: smartLayout),
                        ],
                      ),
                    )
                  else
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          widget.layoutBuilder(smartLayout, mobileLayout),
                          if (widget.needBottomSpacer) const Spacer(),
                          if (widget.supportBottomWidget != null)
                            widget.supportBottomWidget!,
                          const SizedBox(height: AppDimensions.medium),
                          AvtovasFooter(smartLayout: smartLayout),
                        ],
                      ),
                    ),
                ],
              ),
              GestureDetector(
                onTap: _closeDrawer,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: KeyedSubtree(
                    key: ValueKey<bool>(_hasDrawerOpen),
                    child: _hasDrawerOpen
                        ? SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height,
                            child: const ColoredBox(color: Colors.black26),
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
              SizeTransition(
                sizeFactor: _drawerAnimation,
                axis: Axis.horizontal,
                child: _AvtovasDrawer(
                  closeDrawer: _closeDrawer,
                  currentRoute: currentRoute,
                  onMyTripsTap: cubit.navigateToMyTrips,
                  scrollToFooter: _scrollToFooter,
                  onPassengersTap: cubit.navigateToPassengers,
                  onPaymentsHistoryTap: cubit.navigateToPaymentsHistory,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

final class _AvtovasDrawer extends StatelessWidget {
  final AsyncCallback closeDrawer;
  final VoidCallback onPassengersTap;
  final VoidCallback onMyTripsTap;
  final VoidCallback onPaymentsHistoryTap;
  final VoidCallback scrollToFooter;
  final String currentRoute;

  const _AvtovasDrawer({
    required this.closeDrawer,
    required this.onPassengersTap,
    required this.onMyTripsTap,
    required this.onPaymentsHistoryTap,
    required this.scrollToFooter,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.drawerWidth,
      height: MediaQuery.sizeOf(context).height,
      child: ColoredBox(
        color: context.theme.mainAppColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppDimensions.mediumLarge),
            Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: closeDrawer,
                  icon: Icon(
                    Icons.close_sharp,
                    color: context.theme.whiteTextColor,
                  ),
                ),
                const SizedBox(width: AppDimensions.mediumLarge),
              ],
            ),
            AvtovasButton.icon(
              buttonText: context.locale.myTrips,
              svgPath: WebAssets.tripsIcon,
              onTap: currentRoute != Routes.myTripsPath.name
                  ? () => closeDrawer().whenComplete(onMyTripsTap)
                  : closeDrawer,
              iconColor: context.theme.whiteTextColor,
              margin: const EdgeInsets.symmetric(
                horizontal: AppDimensions.medium,
              ),
            ),
            AvtovasButton.icon(
              buttonText: context.locale.passenger,
              svgPath: WebAssets.passengerIcon,
              onTap: currentRoute != Routes.passengersPath.name
                  ? () => closeDrawer().whenComplete(onPassengersTap)
                  : closeDrawer,
              iconColor: context.theme.whiteTextColor,
              margin: const EdgeInsets.symmetric(
                horizontal: AppDimensions.medium,
              ),
            ),
            AvtovasButton.icon(
              buttonText: context.locale.paymentHistory,
              svgPath: WebAssets.paymentHistoryIcon,
              onTap: currentRoute != Routes.paymentsHistoryPath.name
                  ? () => closeDrawer().whenComplete(onPaymentsHistoryTap)
                  : closeDrawer,
              iconColor: context.theme.whiteTextColor,
              margin: const EdgeInsets.symmetric(
                horizontal: AppDimensions.medium,
              ),
            ),
            AvtovasButton.icon(
              buttonText: context.locale.referenceInformation,
              svgPath: WebAssets.infoIcon,
              onTap: () => closeDrawer().whenComplete(scrollToFooter),
              iconColor: context.theme.whiteTextColor,
              margin: const EdgeInsets.symmetric(
                horizontal: AppDimensions.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
