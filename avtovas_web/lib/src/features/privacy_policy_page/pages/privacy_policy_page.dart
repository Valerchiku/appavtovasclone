import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/privacy_policy_page/cubit/privacy_policy_cubit.dart';
import 'package:avtovas_web/src/features/privacy_policy_page/widgets/privacy_policy_body/privacy_policy_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<PrivacyPolicyCubit>(
      child: BlocBuilder<PrivacyPolicyCubit, PrivacyPolicyState>(
        builder: (context, state) {
          return BasePageBuilder(
            layoutBuilder: (smartLayout, mobileLayout) {
              return PrivacyPolicyBody(
                smartLayout: smartLayout,
              );
            },
          );
        },
      ),
    );
  }
}
