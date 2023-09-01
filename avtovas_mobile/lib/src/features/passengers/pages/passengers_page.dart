import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/main/widgets/profile_widgets/profile_alert.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_mobile/src/features/passengers/utils/alert_types.dart';
import 'package:avtovas_mobile/src/features/passengers/utils/sheet_types.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passenger_alert.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passenger_citizenship_sheet.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passenger_date_picker_sheet.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passenger_document_sheet.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passenger_rate_sheet.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passenger_sheet.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passengers_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

final class PassengersPage extends StatefulWidget {
  const PassengersPage({
    super.key,
  });

  @override
  State<PassengersPage> createState() => _PassengerPageState();
}

class _PassengerPageState extends State<PassengersPage> {
  late final SheetController _sheetController;

  bool _listenWhen(PassengersState prev, PassengersState current) {
    return prev.route.type == null && current.route.type != null;
  }

  void _listener(BuildContext context, PassengersState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  @override
  void initState() {
    super.initState();

    _sheetController = SheetController();
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<PassengersCubit>(
      child: BlocConsumer<PassengersCubit, PassengersState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<PassengersCubit>(context);

          return BaseNavigationPage(
            appBarTitle: context.locale.passengersTitle,
            leadingSvgPath: AppAssets.backArrowIcon,
            onLeadingTap: cubit.onBackButtonTap,
            onNavigationItemTap: cubit.onNavigationItemTap,
            bottomSheetStatus: state.bottomSheetStatus,
            bottomSheet: _BottomSheet(
              cubit: cubit,
              sheetTypes: state.sheetType,
              sheetController: _sheetController,
            ),
            alertStatus: state.alertStatus,
            alert: _Alert(
              cubit: cubit,
              alertTypes: state.alertType,
              sheetController: _sheetController,
            ),
            body: const PassengersBody(),
          );
        },
      ),
    );
  }
}

final class _BottomSheet extends StatelessWidget {
  final PassengersCubit cubit;
  final PassengerSheetTypes sheetTypes;
  final SheetController sheetController;

  const _BottomSheet({
    required this.cubit,
    required this.sheetTypes,
    required this.sheetController,
  });

  @override
  Widget build(BuildContext context) {
    return switch (sheetTypes) {
      PassengerSheetTypes.passenger => PassengerSheet(
          cubit: cubit,
          sheetController: sheetController,
        ),
      PassengerSheetTypes.datePicker => PassengerDatePickerSheet(
          cubit: cubit,
          sheetController: sheetController,
        ),
      PassengerSheetTypes.citizenship => PassengerCitizenshipSheet(
          cubit: cubit,
          sheetController: sheetController,
        ),
      PassengerSheetTypes.document => PassengerDocumentSheet(
          cubit: cubit,
          sheetController: sheetController,
        ),
      PassengerSheetTypes.rate => PassengerRateSheet(
          cubit: cubit,
          sheetController: sheetController,
        ),
    };
  }
}

final class _Alert extends StatelessWidget {
  final PassengersCubit cubit;
  final PassengerAlertTypes alertTypes;
  final SheetController sheetController;

  const _Alert({
    required this.cubit,
    required this.alertTypes,
    required this.sheetController,
  });

  @override
  Widget build(BuildContext context) {
    return switch (alertTypes) {
      PassengerAlertTypes.add => PassengerAlert(
          cubit: cubit,
          sheetController: sheetController,
        ),
      PassengerAlertTypes.save => PassengerAlert(
          cubit: cubit,
          sheetController: sheetController,
        ),
      PassengerAlertTypes.delete => PassengerAlert(
          cubit: cubit,
          sheetController: sheetController,
        ),
    };
  }
}
