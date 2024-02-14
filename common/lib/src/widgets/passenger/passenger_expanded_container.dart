import 'package:collection/collection.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:common/src/widgets/passenger/passenger_citizenship_sheet.dart';
import 'package:common/src/widgets/passenger/passenger_date_picker_sheet.dart';
import 'package:common/src/widgets/passenger/passenger_document_type_sheet.dart';
import 'package:common/src/widgets/passenger/passenger_rate_sheet.dart';
import 'package:common/src/widgets/passenger/passenger_seats_sheet.dart';
import 'package:common/src/widgets/utils_widgets/support_methods.dart';
import 'package:core/domain/entities/single_trip/single_trip_fares.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

typedef PassengerChanged = void Function({
  String? firstName,
  String? lastName,
  String? surname,
  String? gender,
  DateTime? birthdayDate,
  String? citizenship,
  String? documentType,
  String? documentData,
  String? rate,
});

final class PassengerExpandedContainer extends StatefulWidget {
  final int passengerNumber;
  final VoidCallback onSelectPassengerTap;
  final bool withRemoveButton;
  final VoidCallback? removePassenger;
  final List<String> availableSeats;
  final ValueChanged<String> onSeatChanged;
  final ValueChanged<bool> onSurnameVisibleChanged;
  final PassengerChanged onPassengerChanged;
  final VoidCallback onGenderChanged;
  final bool noSurname;
  final String ticketPrice;
  final String firstNameValue;
  final String lastNameValue;
  final String? surnameValue;
  final String genderValue;
  final DateTime birthdayDateValue;
  final String citizenshipValue;
  final String documentTypeValue;
  final String documentDataValue;
  final String rateValue;
  final String seatValue;
  final bool isGenderError;
  final List<GlobalKey<FormState>>? formKeys;
  final List<SingleTripFares> singleTripFares;

  const PassengerExpandedContainer({
    required this.passengerNumber,
    required this.onSelectPassengerTap,
    required this.withRemoveButton,
    required this.availableSeats,
    required this.onSeatChanged,
    required this.onSurnameVisibleChanged,
    required this.onPassengerChanged,
    required this.onGenderChanged,
    required this.noSurname,
    required this.ticketPrice,
    required this.firstNameValue,
    required this.lastNameValue,
    required this.surnameValue,
    required this.genderValue,
    required this.birthdayDateValue,
    required this.citizenshipValue,
    required this.documentTypeValue,
    required this.documentDataValue,
    required this.rateValue,
    required this.isGenderError,
    required this.seatValue,
    required this.singleTripFares,
    this.removePassenger,
    this.formKeys,
    super.key,
  });

  @override
  State<PassengerExpandedContainer> createState() =>
      _PassengerExpandedContainerState();
}

class _PassengerExpandedContainerState
    extends State<PassengerExpandedContainer> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _dateController;
  late final TextEditingController _citizenshipController;
  late final TextEditingController _documentTypeController;
  late final TextEditingController _rateController;
  late final TextEditingController _seatsController;
  late final MaskedTextController _maskedDocumentDataController;

  var _cantCallOnPassengerChanged = false;

  @override
  void initState() {
    super.initState();

    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _surnameController = TextEditingController();
    _maskedDocumentDataController = MaskedTextController(mask: '00000');
    _dateController = TextEditingController();
    _citizenshipController = TextEditingController();
    _documentTypeController = TextEditingController();
    _rateController = TextEditingController();
    _seatsController = TextEditingController();

    Future.delayed(Duration.zero, () => _fillDocumentDataMask(context));
  }

  void _onGenderChanged(BuildContext context, Genders gender) {
    widget.onPassengerChanged(
      gender:
          gender == Genders.male ? context.locale.male : context.locale.female,
    );
    widget.onGenderChanged();
  }

  @override
  void didUpdateWidget(covariant PassengerExpandedContainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    _fillControllers();
  }

  void _fillDocumentDataMask(BuildContext context) {
    final documentDataFormatMask = TextInputFormatters.documentDataFormatter(
      context,
      widget.documentTypeValue,
    );

    if (_maskedDocumentDataController.mask != documentDataFormatMask.mask) {
      _maskedDocumentDataController
        ..mask = documentDataFormatMask.mask
        ..translator = documentDataFormatMask.filter;
    }

    _maskedDocumentDataController.text = widget.documentDataValue;
  }

  void _fillController(TextEditingController controller, String newText) {
    controller.value = controller.value.copyWith(
      text: newText,
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: newText.length,
        ),
      ),
    );
  }

  void _fillControllers([VoidCallback? action]) {
    action?.call();

    _fillController(_firstNameController, widget.firstNameValue);
    _fillController(_lastNameController, widget.lastNameValue);
    _fillController(_surnameController, widget.surnameValue ?? '');
    _fillController(
      _dateController,
      widget.birthdayDateValue.isAfter(DateTime.now())
          ? ''
          : widget.birthdayDateValue.viewDateFormat(),
    );
    _fillController(_citizenshipController, widget.citizenshipValue);
    _fillController(_documentTypeController, widget.documentTypeValue);
    _fillController(_rateController, widget.rateValue);
    _fillController(_seatsController, widget.seatValue);

    Future.delayed(Duration.zero, () {
      _fillDocumentDataMask(context);
      setState(() => _cantCallOnPassengerChanged = false);
    });
  }

  Future<void> _onDateFieldTap(BuildContext context) async {
    if (kIsWeb) {
      final now = DateTime.now();

      final tripDate = await SupportMethods.showAvtovasDatePicker(
        context,
        showDatePicker(
          context: context,
          initialDate: DateTime.parse('2000-01-01'),
          confirmText: 'Выбрать дату',
          lastDate: now.leaveDateOnly(),
          firstDate: now.copyWith(year: now.year - 120).leaveDateOnly(),
          builder: (context, child) {
            return Theme(
              data: context.themeData.copyWith(
                datePickerTheme: DatePickerThemeData(
                  dividerColor: context.theme.mainAppColor,
                  shape: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(CommonDimensions.mediumLarge),
                    ),
                  ),
                  headerForegroundColor: context.theme.whiteTextColor,
                  headerBackgroundColor: context.theme.mainAppColor,
                  dayOverlayColor: MaterialStateProperty.all(
                    context.theme.mainAppColor.withOpacity(0.1),
                  ),
                  yearOverlayColor: MaterialStateProperty.all(
                    context.theme.mainAppColor.withOpacity(0.1),
                  ),
                  confirmButtonStyle: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.mainAppColor,
                    foregroundColor: context.theme.whiteTextColor,
                    textStyle: context.themeData.textTheme.bodyLarge?.copyWith(
                      color: context.theme.whiteTextColor,
                    ),
                  ),
                ),
                colorScheme: ColorScheme.light(
                  primary: context.theme.mainAppColor,
                ),
              ),
              child: child!,
            );
          },
        ),
      );

      if (tripDate != null) {
        widget.formKeys?.elementAtOrNull(3)?.currentState?.reset();
        _dateController.text = tripDate.requestDateFormat();
        widget.onPassengerChanged(birthdayDate: tripDate);
      }
    } else {
      return SupportMethods.showAvtovasBottomSheet(
        context: context,
        useCloseButton: false,
        child: PassengerDatePickerSheet(
          onBirthdayDateChanged: (value) {
            widget.formKeys?.elementAtOrNull(3)?.currentState?.reset();
            _dateController.text = value.requestDateFormat();
            widget.onPassengerChanged(birthdayDate: value);
          },
          initialDate: widget.birthdayDateValue,
        ),
      );
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _surnameController.dispose();
    _maskedDocumentDataController.dispose();
    _dateController.dispose();
    _citizenshipController.dispose();
    _documentTypeController.dispose();
    _rateController.dispose();
    _seatsController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TicketingContainer(
      backgroundColor:
          AvtovasPlatform.isWeb ? context.theme.containerBackgroundColor : null,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text(
                context.locale.passengerAmount(widget.passengerNumber),
                style: context.themeData.textTheme.titleLarge?.copyWith(
                  fontSize: CommonFonts.sizeHeadlineMedium,
                ),
              ),
              const Spacer(),
              AvtovasButton.icon(
                buttonText: context.locale.selectPassenger,
                backgroundOpacity: 0,
                textStyle: context.themeData.textTheme.titleLarge?.copyWith(
                  color: context.theme.primaryTextColor,
                ),
                svgPath: ImagesAssets.passengerSmallIcon,
                buttonColor: context.theme.transparent,
                onTap: () {
                  widget.onSelectPassengerTap();
                  setState(() => _cantCallOnPassengerChanged = true);
                },
              ),
              if (widget.withRemoveButton) ...[
                const SizedBox(width: CommonDimensions.medium),
                Material(
                  color: context.theme.transparent,
                  child: AvtovasVectorButton(
                    onTap: () => widget.removePassenger?.call(),
                    svgAssetPath: ImagesAssets.crossIcon,
                  ),
                ),
              ],
            ],
          ),
          Row(
            children: [
              Expanded(
                child: _PassengerValidatorInputField(
                  controller: _lastNameController,
                  formKey: widget.formKeys?.elementAtOrNull(1),
                  fieldTitle: context.locale.lastName,
                  onValueChanged: _cantCallOnPassengerChanged
                      ? null
                      : (value) {
                          widget.onPassengerChanged(
                            lastName: value,
                          );
                        },
                ),
              ),
              const SizedBox(width: CommonDimensions.mediumLarge),
              Expanded(
                child: _PassengerValidatorInputField(
                  controller: _firstNameController,
                  formKey: widget.formKeys?.firstOrNull,
                  fieldTitle: context.locale.firstName,
                  onValueChanged: _cantCallOnPassengerChanged
                      ? null
                      : (value) => widget.onPassengerChanged(
                            firstName: value,
                          ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: AnimatedSizedBox(
                  toHeight: widget.noSurname ? CommonDimensions.none : null,
                  child: _PassengerValidatorInputField(
                    controller: _surnameController,
                    validator: (value) {
                      if (!widget.noSurname && value != null && value.isEmpty) {
                        return 'Поле должно быть заполнено';
                      }

                      return null;
                    },
                    formKey: widget.formKeys?.elementAtOrNull(2),
                    fieldTitle: context.locale.surname,
                    onValueChanged: _cantCallOnPassengerChanged
                        ? null
                        : (value) => widget.onPassengerChanged(
                              surname: value,
                            ),
                  ),
                ),
              ),
              const SizedBox(width: CommonDimensions.mediumLarge),
              const Spacer(),
            ],
          ),
          AvtovasCheckbox(
            onChanged: (value) => widget.onSurnameVisibleChanged(value!),
            value: widget.noSurname,
            checkboxText: context.locale.noSurname,
          ),
          GenderSwitcher(
            onGenderChanged: (value) => _onGenderChanged(context, value),
            selectedGender: widget.genderValue.isEmpty
                ? null
                : widget.genderValue == context.locale.male
                    ? Genders.male
                    : Genders.female,
            isError: widget.isGenderError,
          ),
          Row(
            children: [
              Expanded(
                child: _PassengerValidatorInputField(
                  controller: _dateController,
                  formKey: widget.formKeys?.elementAtOrNull(3),
                  fieldTitle: context.locale.birthdayDate,
                  readOnly: true,
                  enableInteractiveSelection: false,
                  onTap: () => _onDateFieldTap(context),
                ),
              ),
              const SizedBox(width: CommonDimensions.mediumLarge),
              Expanded(
                child: _PassengerValidatorInputField(
                  controller: _citizenshipController,
                  formKey: widget.formKeys?.elementAtOrNull(4),
                  enableInteractiveSelection: false,
                  fieldTitle: context.locale.citizenship,
                  readOnly: true,
                  onTap: () => SupportMethods.showAvtovasBottomSheet(
                    context: context,
                    sheetTitle: context.locale.citizenship,
                    child: PassengerCitizenshipSheet(
                      onCitizenshipChanged: (value) {
                        widget.formKeys
                            ?.elementAtOrNull(4)
                            ?.currentState
                            ?.reset();
                        _citizenshipController.text = value;
                        widget.onPassengerChanged(citizenship: value);
                      },
                      selectedCountry: widget.citizenshipValue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: _PassengerValidatorInputField(
                  controller: _documentTypeController,
                  formKey: widget.formKeys?.elementAtOrNull(5),
                  fieldTitle: context.locale.document,
                  enableInteractiveSelection: false,
                  readOnly: true,
                  onTap: () => SupportMethods.showAvtovasBottomSheet(
                    context: context,
                    sheetTitle: context.locale.document,
                    child: PassengerDocumentTypeSheet(
                      onDocumentTypeChanged: (value) {
                        widget.formKeys
                            ?.elementAtOrNull(5)
                            ?.currentState
                            ?.reset();
                        _documentTypeController.text = value;
                        widget.onPassengerChanged(documentType: value);
                      },
                      selectedDocumentType: widget.documentTypeValue,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: CommonDimensions.mediumLarge),
              Expanded(
                child: _PassengerValidatorInputField(
                  controller: _maskedDocumentDataController,
                  formKey: widget.formKeys?.elementAtOrNull(6),
                  fieldTitle: widget.documentTypeValue ==
                              DocumentTypes.documentTypes(context).first ||
                          widget.documentTypeValue ==
                              DocumentTypes.documentTypes(context)[2] ||
                          widget.documentTypeValue ==
                              DocumentTypes.documentTypes(context)[3] ||
                          widget.documentTypeValue ==
                              DocumentTypes.documentTypes(context)[1]
                      ? context.locale.seriesAndNumber
                      : context.locale.number,
                  onValueChanged: _cantCallOnPassengerChanged
                      ? null
                      : (value) => widget.onPassengerChanged(
                            documentData: value,
                          ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: _PassengerValidatorInputField(
                  controller: _rateController,
                  formKey: widget.formKeys?.elementAtOrNull(7),
                  fieldTitle: context.locale.rate,
                  enableInteractiveSelection: false,
                  readOnly: true,
                  onTap: () => SupportMethods.showAvtovasBottomSheet(
                    context: context,
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                      maxHeight: 250,
                    ),
                    sheetTitle: context.locale.rate,
                    child: PassengerRateSheet(
                      onRateChanged: (value) {
                        widget.formKeys
                            ?.elementAtOrNull(7)
                            ?.currentState
                            ?.reset();
                        _rateController.text = value;
                        widget.onPassengerChanged(rate: value);
                      },
                      selectedRate: widget.rateValue,
                      singleTripFares: widget.singleTripFares,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: CommonDimensions.mediumLarge),
              Expanded(
                child: _PassengerValidatorInputField(
                  controller: _seatsController,
                  formKey: widget.formKeys?.elementAtOrNull(8),
                  fieldTitle: context.locale.seat,
                  enableInteractiveSelection: false,
                  readOnly: true,
                  onTap: () => SupportMethods.showAvtovasBottomSheet(
                    context: context,
                    sheetTitle: context.locale.seat,
                    child: PassengerSeatsSheet(
                      availableSeats: widget.availableSeats,
                      onSeatChanged: (value) {
                        widget.formKeys
                            ?.elementAtOrNull(8)
                            ?.currentState
                            ?.reset();
                        _seatsController.text = value;
                        widget.onSeatChanged(value);
                      },
                      selectedSeat: widget.seatValue,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(color: context.theme.dividerColor),
          const SizedBox(height: CommonDimensions.small),
          Row(
            children: [
              Text(
                context.locale.priceByRate,
                style: context.themeData.textTheme.titleLarge,
              ),
              const Spacer(),
              // TODO(dev): Use model instead.
              Text(
                widget.ticketPrice,
                style: context.themeData.textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: CommonDimensions.small),
          Divider(color: context.theme.dividerColor),
          const SizedBox(height: CommonDimensions.small),
          Row(
            children: [
              Text(
                context.locale.total,
                style: context.themeData.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                widget.ticketPrice,
                style: context.themeData.textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: CommonDimensions.small),
        ].insertBetween(
          const SizedBox(height: CommonDimensions.medium),
        ),
      ),
    );
  }
}

final class _PassengerValidatorInputField extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  final bool readOnly;
  final String fieldTitle;
  final VoidCallback? onTap;
  final ValueChanged<String>? onValueChanged;
  final bool enableInteractiveSelection;

  const _PassengerValidatorInputField({
    required this.fieldTitle,
    this.controller,
    this.formKey,
    this.readOnly = false,
    this.validator,
    this.onTap,
    this.enableInteractiveSelection = true,
    this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    const maxLines = 1;

    return InputField(
      enableInteractiveSelection: enableInteractiveSelection,
      maxLines: maxLines,
      controller: controller,
      validator: validator ??
          (value) {
            if (value != null && value.isEmpty) {
              return 'Поле должно быть заполнено!';
            }

            return null;
          },
      formKey: formKey,
      readOnly: readOnly,
      fieldTitle: fieldTitle,
      onTap: onTap,
      onChanged: (value) {
        if (value.isNotEmpty) {
          formKey?.currentState!.validate();
        }

        onValueChanged?.call(value);
      },
    );
  }
}
