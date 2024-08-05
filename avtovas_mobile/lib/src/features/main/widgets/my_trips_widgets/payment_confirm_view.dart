import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

final class PaymentConfirmView extends StatelessWidget {
  final String confirmationUrl;
  final VoidCallback onConfirmPressed;

  const PaymentConfirmView({
    required this.confirmationUrl,
    required this.onConfirmPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Column(
        children: [
          const SizedBox(
            width: AppDimensions.extraLarge,
            height: AppDimensions.small,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.medium),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppDimensions.medium,
                right: AppDimensions.medium,
                bottom: AppDimensions.extraLarge,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.medium,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: InAppWebView(
                    onLoadError: (_, url, ___, ____) {
                      onConfirmPressed();
                    },
                    initialUrlRequest: URLRequest(
                      url: Uri.parse(confirmationUrl),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
