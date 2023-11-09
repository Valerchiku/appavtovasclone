import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/terms_page/cubit/terms_cubit.dart';
import 'package:avtovas_web/src/features/terms_page/widgets/terms_body.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({
    super.key,
  });

  void _listener(BuildContext context, TermsState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(TermsState prev, TermsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<TermsCubit>(
      child: BlocConsumer<TermsCubit, TermsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<TermsCubit>(context);
          return BasePageBuilder(
            layoutBuilder: (smartLayout, mobileLayout) {
              return TermsBody(
                smartLayout: smartLayout,
                onPrivacyPolicyTap: cubit.onPrivacyPolicyButtonTap,
                onConsentToProcessingTap: cubit.onConsentProcessingButtonTap,
                onContractOfferTap: cubit.onContractOfferButtonTap,
              );
            },
          );
        },
      ),
    );
  }
}
