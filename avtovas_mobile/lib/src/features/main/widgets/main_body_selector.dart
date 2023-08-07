import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:avtovas_mobile/src/features/main/widgets/main_serach_widgets/main_search_body.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trips_body.dart';
import 'package:avtovas_mobile/src/features/main/widgets/profile_widgets/profile_body.dart';
import 'package:avtovas_mobile/src/features/main/widgets/support_widgets/support_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class BodySelector extends StatefulWidget {
  final PageController pageController;

  const BodySelector({
    required this.pageController,
    super.key,
  });

  @override
  State<BodySelector> createState() => _BodySelectorState();
}

class _BodySelectorState extends State<BodySelector> {
  final _navigationPanelCubit = i.get<NavigationPanelCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPanelCubit, NavigationPanelState>(
      bloc: _navigationPanelCubit,
      builder: (context, state) {
        return PageView(
          controller: widget.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            MainSearchBody(),
            MyTripsBody(),
            SupportBody(),
            ProfileBody(),
          ],
        );
      },
    );
  }
}
