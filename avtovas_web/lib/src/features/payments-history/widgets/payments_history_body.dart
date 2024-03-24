import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:avtovas_web/src/features/payments-history/cubit/payments_history_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentsHistoryBody extends StatelessWidget {
  const PaymentsHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentsHistoryCubit, PaymentsHistoryState>(
      builder: (context, state) {
        if (state.payments == null ||
            state.payments!.isEmpty ||
            state.statusedTrips == null ||
            state.statusedTrips!.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: AppDimensions.extraLarge * 2),
              const AvtovasVectorImage(
                svgAssetPath: WebAssets.emptyPaymentsHistoryIcon,
              ),
              Text(
                context.locale.emptyPaymentsHistoryTitle,
                textAlign: TextAlign.center,
                style: context.themeData.textTheme.headlineLarge?.copyWith(
                  fontSize: WebFonts.sizeDisplayMedium,
                  color: context.theme.emptyPaymentsHistoryTitle,
                ),
              ),
            ],
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.large,
            horizontal: AppDimensions.mediumLarge,
          ),
          child: Column(
            children: <Widget>[
              for (final payment in state.payments!)
                PaymentHistoryItem(
                  paymentDate: payment.paymentDate,
                  paymentDescription: payment.paymentDescription,
                  paymentPrice: payment.paymentPrice,
                  paymentAccess: PaymentHistoryStatusHandler
                      .paymentHistoryStatusFromString(
                    payment.paymentStatus,
                  ),
                ),
            ].insertBetween(Divider(color: context.theme.dividerColor)),
          ),
        );
      },
    );
  }
}
