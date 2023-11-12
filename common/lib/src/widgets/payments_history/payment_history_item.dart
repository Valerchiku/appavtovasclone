import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class PaymentHistoryItem extends StatelessWidget {
  final DateTime paymentDate;
  final String paymentDescription;
  final String paymentPrice;
  final PaymentAccess paymentAccess;

  const PaymentHistoryItem({
    required this.paymentDate,
    required this.paymentDescription,
    required this.paymentPrice,
    required this.paymentAccess,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: CommonDimensions.large,
          ),
          child: Row(
            children: [
              Text(
                paymentDate.viewDateFormat(),
                style: context.themeData.textTheme.bodyLarge?.copyWith(
                  fontSize: CommonFonts.sizeHeadlineMedium,
                ),
              ),
              const Spacer(),
              Text(
                '${paymentAccess == PaymentAccess.paid ? '-' : '+'}'
                '$paymentPrice р.',
                style: context.themeData.textTheme.bodyLarge?.copyWith(
                  color: paymentAccess == PaymentAccess.paid
                      ? context.theme.errorColor
                      : context.theme.primaryTextColor,
                  fontSize: CommonFonts.sizeHeadlineMedium,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: CommonDimensions.small),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: CommonDimensions.large,
          ),
          child: Text(
            paymentDescription,
            style: context.themeData.textTheme.bodyLarge?.copyWith(
              fontSize: CommonFonts.sizeHeadlineMedium,
            ),
          ),
        ),
      ],
    );
  }
}

enum PaymentAccess { returned, paid }
