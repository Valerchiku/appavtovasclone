import 'package:avtovas_web/src/common/constants/app_animations.dart';
import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/cubit/avtovas_contacts_cubit.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/avtovas_contacts_body.dart';
import 'package:common/avtovas_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class AvtovasContactsPage extends StatelessWidget {
  const AvtovasContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<AvtovasContactsCubit>(
      child: BlocBuilder<AvtovasContactsCubit, AvtovasContactsState>(
        builder: (context, state) {
          final cubit = CubitScope.of<AvtovasContactsCubit>(context);

          return Stack(
            children: [
              BasePageBuilder(
                layoutBuilder: (smartLayout, mobileLayout) {
                  return AvtovasContactsBody(
                    cubit: cubit,
                    smartLayout: smartLayout,
                    mobileLayout: mobileLayout,
                    avtovasPhoneNubmer: state.avtovasPhoneNumber,
                  );
                },
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                child: state.avtovasPhoneNumber.isEmpty
                    ? SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height,
                        child: ColoredBox(
                          color: context.theme.whiteTextColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                AppLottie.busLoading,
                                width: 100,
                                height: 100,
                              ),
                            ],
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
  }
}
