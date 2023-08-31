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

class PassengersPage extends StatelessWidget {
  const PassengersPage({super.key});

  bool _listenWhen(PassengersState prev, PassengersState current) {
    return prev.route.type == null && current.route.type != null;
  }

  void _listener(BuildContext context, PassengersState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
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

  const _BottomSheet({
    required this.cubit,
    required this.sheetTypes,
  });

  @override
  Widget build(BuildContext context) {
    return switch (sheetTypes) {
      PassengerSheetTypes.passenger => PassengerSheet(
          cubit: cubit,
        ),
      PassengerSheetTypes.datePicker => PassengerDatePickerSheet(
          cubit: cubit,
        ),
      PassengerSheetTypes.citizenship => PassengerCitizenshipSheet(
          cubit: cubit,
        ),
      PassengerSheetTypes.document => PassengerDocumentSheet(
          cubit: cubit,
        ),
      PassengerSheetTypes.rate => PassengerRateSheet(
          cubit: cubit,
        ),
    };
  }
}

final class _Alert extends StatelessWidget {
  final PassengersCubit cubit;
  final PassengerAlertTypes alertTypes;

  const _Alert({
    required this.cubit,
    required this.alertTypes,
  });

  @override
  Widget build(BuildContext context) {
    return switch (alertTypes) {
      PassengerAlertTypes.add => PassengerAlert(
          cubit: cubit,
        ),
      PassengerAlertTypes.save => PassengerAlert(
          cubit: cubit,
        ),
      PassengerAlertTypes.delete => PassengerAlert(
          cubit: cubit,
        ),
    };
  }
}
