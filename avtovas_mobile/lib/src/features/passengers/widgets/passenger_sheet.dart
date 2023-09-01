import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/widgets/avtovas_bottom_sheet/avtovas_bottom_sheet.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_mobile/src/features/passengers/utils/alert_types.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passenger_container.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

final class PassengerSheet extends StatefulWidget {
  final PassengersCubit cubit;
  final SheetController sheetController;

  const PassengerSheet({
    required this.cubit,
    required this.sheetController,
    super.key,
  });

  @override
  State<PassengerSheet> createState() => _PassengerSheetState();
}

class _PassengerSheetState extends State<PassengerSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassengersCubit, PassengersState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return AvtovasBottomSheet(
          controller: widget.sheetController,
          onClose: ([_]) {
            widget.sheetController.collapse()?.then(
                  (value) => widget.cubit
                    ..clearCurrentPassenger()
                    ..closeBottomSheet(),
                );
          },
          contentPadding: const EdgeInsets.symmetric(
            vertical: AppDimensions.large,
            horizontal: AppDimensions.large,
          ),
          backgroundColor: context.theme.containerBackgroundColor,
          contentBuilder: (_, __) {
            return PassengerContainer(
              isNewPassenger: state.newPassenger,
              updatePassengers: state.newPassenger
                  ? widget.cubit.openAddAlert
                  : widget.cubit.openSaveAlert,
              removePassenger:
                  state.newPassenger ? null : widget.cubit.openDeleteAlert,
              onClose: widget.sheetController.collapse,
              onSheetTypeChanged: widget.cubit.changeSheetType,
              onSurnameVisibleChanged: (value) =>
                  widget.cubit.changeSurnameVisibility(
                noSurname: value,
              ),
              noSurname: state.noSurname,
              onGenderChanged: (value) => widget.cubit.changeCurrentPassenger(
                gender: value,
              ),
              onFirstNameChanged: (value) =>
                  widget.cubit.changeCurrentPassenger(
                firstName: value,
              ),
              onLastNameChanged: (value) => widget.cubit.changeCurrentPassenger(
                lastName: value,
              ),
              onSurnameChanged: (value) => widget.cubit.changeCurrentPassenger(
                surname: value,
              ),
              onSeriesAndNumberChanged: (value) =>
                  widget.cubit.changeCurrentPassenger(
                documentData: value,
              ),
              selectedGender: state.currentPassenger.gender,
              firstNameInitial: state.currentPassenger.firstName,
              lastNameInitial: state.currentPassenger.lastName,
              surnameInitial: state.currentPassenger.surname,
              birthdayInitial: state.currentPassenger.birthdayDate.isAfter(
                DateTime.now(),
              )
                  ? ''
                  : state.currentPassenger.birthdayDate.requestDateFormat(),
              citizenshipInitial: state.currentPassenger.citizenship,
              documentTypeInitial: state.currentPassenger.documentType,
              documentDataInitial: state.currentPassenger.documentData,
              rateInitial: state.currentPassenger.rate,
            );
          },
        );
      },
    );
  }
}
