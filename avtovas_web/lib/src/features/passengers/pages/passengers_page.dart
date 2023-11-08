import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_web/src/features/passengers/widgets/passengers_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassengersPage extends StatelessWidget {
  const PassengersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<PassengersCubit>(
      child: BlocBuilder<PassengersCubit, PassengersState>(
        builder: (context, state) {
          final cubit = CubitScope.of<PassengersCubit>(context);

          return BasePageBuilder(
            layoutBuilder: (_, __) {
              return PassengersBody(
                cubit: cubit,
              );
            },
            hasScrollBody: false,
            supportBottomWidget: state.canRenderFillContainer
                ? null
                : AvtovasButton.icon(
                    buttonText: context.locale.addPassenger,
                    svgPath: WebAssets.passengerIcon,
                    margin: const EdgeInsets.all(AppDimensions.extraLarge),
                    padding: const EdgeInsets.all(AppDimensions.mediumLarge),
                    mainAxisAlignment: MainAxisAlignment.center,
                    borderColor: context.theme.mainAppColor,
                    buttonColor: context.theme.transparent,
                    backgroundOpacity: 0,
                    textStyle:
                        context.themeData.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: context.theme.primaryTextColor,
                    ),
                    onTap: () => cubit
                      ..changePassengerStatus(isNewPassenger: true)
                      ..changeFillRenderStatus(),
                  ),
          );
        },
      ),
    );
  }
}
