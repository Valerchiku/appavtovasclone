import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/widgets/avtovas_bottom_sheet/avtovas_bottom_sheet.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_mobile/src/features/passengers/utils/sheet_types.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

final class PassengerCitizenshipSheet extends StatefulWidget {
  final PassengersCubit cubit;

  const PassengerCitizenshipSheet({
    required this.cubit,
    super.key,
  });

  @override
  State<PassengerCitizenshipSheet> createState() =>
      _PassengerCitizenshipSheetState();
}

class _PassengerCitizenshipSheetState extends State<PassengerCitizenshipSheet> {
  late final SheetController _sheetController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _sheetController = SheetController();
    _scrollController = ScrollController()
      ..addListener(
        () {
          if (_scrollController.offset < -100) {
            widget.cubit.changeSheetType(
              PassengerSheetTypes.passenger,
            );
          }
        },
      );
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassengersCubit, PassengersState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return AvtovasBottomSheet(
          controller: _sheetController,
          onClose: ([_]) {
            widget.cubit.changeSheetType(PassengerSheetTypes.passenger);
          },
          backgroundColor: context.theme.containerBackgroundColor,
          contentBuilder: (_, __) {
            final countries = Countries.countries(context);

            return SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: ListView.builder(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: countries.length,
                itemBuilder: (_, index) {
                  return _CitizenshipItem(
                    onCitizenshipChanged: (value) {
                      widget.cubit
                        ..changeCurrentPassenger(citizenship: value)
                        ..changeSheetType(PassengerSheetTypes.passenger);
                    },
                    country: countries[index],
                    selectedCountry: state.currentPassenger.citizenship,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

final class _CitizenshipItem extends StatelessWidget {
  final ValueChanged<String> onCitizenshipChanged;
  final String country;
  final String selectedCountry;

  const _CitizenshipItem({
    required this.onCitizenshipChanged,
    required this.country,
    required this.selectedCountry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.medium),
      child: Material(
        color: context.theme.transparent,
        child: InkWell(
          onTap: () => onCitizenshipChanged(country),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.medium),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.large),
            child: Row(
              children: [
                Text(
                  country,
                  style: context.themeData.textTheme.titleLarge?.copyWith(
                    fontSize: AppFonts.sizeHeadlineMedium,
                  ),
                ),
                const Spacer(),
                AvtovasCheckbox(
                  onChanged: (_) => onCitizenshipChanged(country),
                  value: country == selectedCountry,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
