import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:avtovas_mobile/src/features/main/widgets/main_serach_widgets/main_search_body.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trips_body.dart';
import 'package:avtovas_mobile/src/features/main/widgets/profile_widgets/profile_body.dart';
import 'package:avtovas_mobile/src/features/main/widgets/support_widgets/support_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class MainBodySelector extends StatefulWidget {
  final PageController pageController;

  const MainBodySelector({
    required this.pageController,
    super.key,
  });

  @override
  State<MainBodySelector> createState() => _MainBodySelectorState();
}

class _MainBodySelectorState extends State<MainBodySelector> {
  final _navigationPanelCubit = i.get<NavigationPanelCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPanelCubit, NavigationPanelState>(
      bloc: _navigationPanelCubit,
      builder: (context, state) {
        return PageView(
          controller: widget.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            MainSearchBody(),
            MyTripsBody(),
            SupportBody(),
            ProfileBody(
              dialog: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
                child: Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CalendarDatePicker(
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now().subtract(
                            Duration(
                              days: 365,
                            ),
                          ),
                          lastDate: DateTime.now().add(
                            Duration(
                              days: 365,
                            ),
                          ),
                          onDateChanged: (DateTime value) {},
                        ),
                        SizedBox(height: 20),
                        TextButton(
                            child: Text('Close'),
                            onPressed: () {
                              setState(() {});
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
