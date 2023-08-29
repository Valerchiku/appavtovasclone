import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/authorization/cubit/authorization_cubit.dart';
import 'package:avtovas_mobile/src/features/authorization/widgets/authorization_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class AuthorizationPage extends StatelessWidget {
  final AuthorizationContent content;
  final String? phoneNumber;

  const AuthorizationPage({
    required this.content,
    this.phoneNumber,
    super.key,
  });

  void _listener(BuildContext context, AuthorizationState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(AuthorizationState prev, AuthorizationState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AuthorizationCubit>(
      child: BlocConsumer<AuthorizationCubit, AuthorizationState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<AuthorizationCubit>(context);

          return BaseNavigationPage(
            appBarTitle: context.locale.flightInformation,
            leadingSvgPath: AppAssets.backArrowIcon,
            onLeadingTap: cubit.onBackButtonTap,
            onNavigationItemTap: cubit.onNavigationItemTap,
            body: AuthorizationBody(
              content: content,
              cubit: cubit,
              phoneNumber: phoneNumber,
            ),
          );
        },
      ),
    );
  }
}

final class AuthorizationPageArguments extends PageArguments {
  final AuthorizationContent content;
  final String? phoneNumber;

  AuthorizationPageArguments({
    required this.content,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        content,
        phoneNumber,
      ];
}
