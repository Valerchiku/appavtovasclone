import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/terms_of_use_page/cubit/terms_of_use_cubit.dart';
import 'package:avtovas_web/src/features/terms_of_use_page/widgets/terms_of_use_body/terms_of_use_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<TermsOfUseCubit>(
      child: BlocBuilder<TermsOfUseCubit, TermsOfUseState>(
        builder: (context, state) {
          return BasePageBuilder(
            layoutBuilder: (smartLayout, mobileLayout) {
              return TermsOfUseBody(
                smartLayout: smartLayout,
              );
            },
          );
        },
      ),
    );
  }
}
