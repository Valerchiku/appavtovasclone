import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/widgets/avtovas_bottom_sheet/avtovas_bottom_sheet.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
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

  var _searchQuery = '';

  @override
  void initState() {
    super.initState();

    _sheetController = SheetController();
    _scrollController = ScrollController()
      ..addListener(
        () {
          if (_scrollController.offset < -100) {
            widget.cubit.closeBottomSheet();
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
            widget.cubit.closeBottomSheet();
          },
          backgroundColor: context.theme.containerBackgroundColor,
          contentBuilder: (_, __) {
            final countries = Countries.countries(context);

            return SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: ListView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(AppDimensions.large),
                          child: InputField(
                            onChanged: (value) => setState(
                              () => _searchQuery = value,
                            ),
                            inputDecoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(
                                AppDimensions.mediumLarge,
                              ),
                              border: const OutlineInputBorder(),
                              hintText: context.locale.search,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.9,
                    child: ListView.builder(
                      itemCount: _searchQuery.isEmpty
                          ? countries.length
                          : countries
                              .where(
                                (country) => country
                                    .toLowerCase()
                                    .contains(_searchQuery.toLowerCase()),
                              )
                              .length,
                      itemBuilder: (_, index) {
                        return _CitizenshipItem(
                          onCitizenshipChanged: (value) {
                            widget.cubit
                              ..changeCurrentPassenger(citizenship: value)
                              ..closeBottomSheet();
                          },
                          country: _searchQuery.isEmpty
                              ? countries[index]
                              : countries
                                  .where(
                                    (country) => country
                                        .toLowerCase()
                                        .contains(_searchQuery.toLowerCase()),
                                  )
                                  .toList()[index],
                          selectedCountry: state.currentPassenger.citizenship,
                        );
                      },
                    ),
                  ),
                ],
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
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.medium),
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
