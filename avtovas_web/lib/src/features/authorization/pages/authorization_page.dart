import 'package:avtovas_web/src/common/constants/app_animations.dart';
import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:avtovas_web/src/features/authorization/cubit/authorization_cubit.dart';
import 'package:avtovas_web/src/features/authorization/widgets/authorization_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

final class AuthorizationPage extends StatelessWidget {
  final AuthorizationContent content;
  final String? phoneNumber;

  const AuthorizationPage({
    required this.content,
    this.phoneNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CubitScope<AuthorizationCubit>(
      child: BlocBuilder<AuthorizationCubit, AuthorizationState>(
        builder: (context, state) {
          final cubit = CubitScope.of<AuthorizationCubit>(context);

          return Stack(
            children: [
              BasePageBuilder(
                layoutBuilder: (_, __) {
                  return AuthorizationBody(
                    content: content,
                    cubit: cubit,
                    phoneNumber: phoneNumber,
                  );
                },
              ),
              Positioned.fill(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: state.shouldShowLoading
                      ? ColoredBox(
                          color: Colors.black26,
                          child: Center(
                            child: Lottie.asset(
                              AppLottie.busLoading,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
