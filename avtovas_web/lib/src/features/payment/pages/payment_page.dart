import 'package:avtovas_web/src/common/navigation/app_router.dart';
import 'package:avtovas_web/src/common/navigation/configurations.dart';
import 'package:avtovas_web/src/common/utils/constants/checkout_widget_html.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

final class PaymentPage extends StatefulWidget {
  final String confirmationToken;
  final String encodedPaymentParams;

  const PaymentPage({
    required this.confirmationToken,
    required this.encodedPaymentParams,
    super.key,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late final PlatformWebViewController _controller;

  @override
  void initState() {
    super.initState();

    final appRouter = AppRouter.appRouter;

    if (widget.confirmationToken.isEmpty) {
      appRouter.navigateTo(
        CustomRoute(
          RouteType.navigateTo,
          myTripsConfig(statusedTripId: '', paymentId: ''),
          shouldClearStack: true,
        ),
      );
    }

    _controller = PlatformWebViewController(
      const PlatformWebViewControllerCreationParams(),
    )..loadHtmlString(
        CheckoutWidgetHtml.checkoutWidgetHtml(
          confirmationToken: widget.confirmationToken,
          encodedPaymentParams: widget.encodedPaymentParams,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatformWebViewWidget(
        PlatformWebViewWidgetCreationParams(controller: _controller),
      ).build(context),
    );
  }
}

final class PaymentArguments extends PageArguments {
  final String confirmationToken;
  final String encodedPaymentParams;

  @override
  List<Object?> get props => [confirmationToken, encodedPaymentParams];

  PaymentArguments({
    required this.confirmationToken,
    required this.encodedPaymentParams,
  });
}
