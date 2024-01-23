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
  final bool fromMyTrips;
  final AuthorizationContent content;
  final String? phoneNumber;

  const AuthorizationPage({
    required this.content,
    required this.fromMyTrips,
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
      child: BlocListener<AuthorizationCubit, AuthorizationState>(
        listener: _listener,
        listenWhen: _listenWhen,
        child: Builder(
          builder: (context) {
            final cubit = CubitScope.of<AuthorizationCubit>(context);

            return WillPopScope(
              onWillPop: () async {
                if (fromMyTrips) cubit.onNavigationItemTap(0);

                return true;
              },
              child: BaseNavigationPage(
                appBarTitle: 'Авторизация',
                leadingSvgPath: AppAssets.backArrowIcon,
                onLeadingTap: () => cubit.onBackButtonTap(
                  fromMyTrips: fromMyTrips,
                ),
                onNavigationItemTap: cubit.onNavigationItemTap,
                body: AuthorizationBody(
                  content: content,
                  cubit: cubit,
                  phoneNumber: phoneNumber,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

final class AuthorizationPageArguments extends PageArguments {
  final AuthorizationContent content;
  final bool fromMyTrips;
  final String? phoneNumber;

  AuthorizationPageArguments({
    required this.content,
    required this.fromMyTrips,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        content,
        fromMyTrips,
        phoneNumber,
      ];
}
