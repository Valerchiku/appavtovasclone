import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/contacts/cubit/contacts_cubit.dart';
import 'package:avtovas_mobile/src/features/contacts/widgets/contacts_body.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  void _listener(BuildContext context, ContactsState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(ContactsState prev, ContactsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<ContactsCubit>(
      child: BlocConsumer<ContactsCubit, ContactsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, _) {
          final cubit = CubitScope.of<ContactsCubit>(context);

          return BaseNavigationPage(
            appBarTitle: context.locale.call,
            leadingSvgPath: AppAssets.backArrowIcon,
            onLeadingTap: cubit.onBackButtonTap,
            onNavigationItemTap: cubit.onNavigationItemTap,
            body: const ContactsBody(),
          );
        },
      ),
    );
  }
}
