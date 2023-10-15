import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

final class PaymentConfirmView extends StatefulWidget {
  final String confirmationUrl;
  final VoidCallback onConfirmPressed;

  const PaymentConfirmView({
    required this.confirmationUrl,
    required this.onConfirmPressed,
    super.key,
  });

  @override
  State<PaymentConfirmView> createState() => _PaymentConfirmViewState();
}

class _PaymentConfirmViewState extends State<PaymentConfirmView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      onLoadError: (_, url, ___, ____) {
        widget.onConfirmPressed();
      },
      initialUrlRequest: URLRequest(
        url: Uri.parse(widget.confirmationUrl),
      ),
    );
  }
}
