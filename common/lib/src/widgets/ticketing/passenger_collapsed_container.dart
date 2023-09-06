// import 'package:common/src/localization/localizations_ext.dart';
// import 'package:common/src/theme/theme_extension.dart';
// import 'package:common/src/utils/constants/common_dimensions.dart';
// import 'package:common/src/utils/constants/common_fonts.dart';
// import 'package:common/src/utils/constants/images_assets.dart';
// import 'package:common/src/utils/list_extension.dart';
// import 'package:common/src/widgets/avtovas_buttons/avtovas_button.dart';
// import 'package:common/src/widgets/input_field/input_field.dart';
// import 'package:common/src/widgets/ticketing/gender_switcher.dart';
// import 'package:common/src/widgets/ticketing/ticketing_container.dart';
// import 'package:common/src/widgets/ticketing/utils/genders.dart';
// import 'package:common/src/widgets/utils_widgets/animated_sized_box.dart';
// import 'package:common/src/widgets/utils_widgets/avtovas_checkbox.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_masked_text2/flutter_masked_text2.dart';

// // ignore_for_file: avoid-non-ascii-symbols

// final class PassengerCollapsedContainer extends StatefulWidget {
//   final Widget countriesMenu;
//   final Widget documentsMenu;
//   final Widget ratesMenu;
//   final Widget? placesMenu;
//   final ValueChanged<Genders> onGenderChanged;
//   final ValueChanged<bool?> onSurnameVisibleChanged;
//   final Genders selectedGender;
//   final bool isSurnameVisible;
//   final String documentType;
//   final String? ticketPrice;
//   final ValueChanged onNameChanged;
//   final ValueChanged onLastNameChanged;
//   final ValueChanged? onSurnameChanged;
//   final ValueChanged onDateOfBirthChanged;
//   final ValueChanged onDocumentNumChanged;
//   const PassengerCollapsedContainer({
//     required this.countriesMenu,
//     required this.documentsMenu,
//     required this.ratesMenu,
//     required this.onGenderChanged,
//     required this.onSurnameVisibleChanged,
//     required this.isSurnameVisible,
//     required this.selectedGender,
//     required this.documentType,
//     required this.onNameChanged,
//     required this.onLastNameChanged,
//     required this.onSurnameChanged,
//     required this.onDateOfBirthChanged,
//     required this.onDocumentNumChanged,
//     this.ticketPrice,
//     this.placesMenu,
//     super.key,
//   });

//   @override
//   State<PassengerCollapsedContainer> createState() =>
//       _PassengerCollapsedContainerState();
// }

// class _PassengerCollapsedContainerState
//     extends State<PassengerCollapsedContainer> {
//   late final MaskedTextController _dateController;

//   @override
//   void initState() {
//     super.initState();

//     _dateController = MaskedTextController(mask: '00-00-0000');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TicketingContainer(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             children: [
//               Text(
//                 context.locale.passengerAmount(1),
//                 style: context.themeData.textTheme.titleLarge?.copyWith(
//                   fontSize: CommonFonts.sizeHeadlineMedium,
//                 ),
//               ),
//               const Spacer(),
//               AvtovasButton.icon(
//                 buttonText: context.locale.selectPassenger,
//                 backgroundOpacity: 0,
//                 textStyle: context.themeData.textTheme.titleLarge?.copyWith(
//                   color: context.theme.primaryTextColor,
//                 ),
//                 svgPath: ImagesAssets.passengerSmallIcon,
//                 buttonColor: context.theme.transparent,
//                 onTap: () {},
//               ),
//             ],
//           ),
//           InputField(
//             hintText: context.locale.firstName,
//             fieldTitle: context.locale.firstName,
//             onChanged: widget.onNameChanged,
//           ),
//           InputField(
//             hintText: context.locale.lastName,
//             fieldTitle: context.locale.lastName,
//             onChanged: widget.onLastNameChanged,
//           ),
//           AnimatedSizedBox(
//             toHeight: widget.isSurnameVisible ? CommonDimensions.none : null,
//             child: InputField(
//               hintText: context.locale.surname,
//               fieldTitle: context.locale.surname,
//               onChanged: widget.onSurnameChanged,
//             ),
//           ),
//           AvtovasCheckbox(
//             onChanged: widget.onSurnameVisibleChanged,
//             value: widget.isSurnameVisible,
//             checkboxText: context.locale.noSurname,
//           ),
//           GenderSwitcher(
//             onGenderChanged: widget.onGenderChanged,
//             selectedGender: widget.selectedGender,
//           ),
//           InputField(
//             controller: _dateController,
//             fieldTitle: context.locale.birthdayDate,
//             keyboardType: TextInputType.datetime,
//             hintText: '__.__.____',
//             onChanged: widget.onDateOfBirthChanged,
//           ),
//           widget.countriesMenu,
//           widget.documentsMenu,
//           InputField(
//             fieldTitle: context.locale.seriesAndNumber,
//             hintText: widget.documentType == 'Паспорт гражданина РФ'
//                 ? '____ ______'
//                 : null,
//             onChanged: widget.onDocumentNumChanged,
//           ),
//           widget.ratesMenu,
//           if (widget.placesMenu != null) widget.placesMenu!,
//           Divider(color: context.theme.dividerColor),
//           const SizedBox(height: CommonDimensions.small),
//           if (widget.ticketPrice != null)
//             Row(
//               children: [
//                 Text(
//                   context.locale.priceByRate,
//                   style: context.themeData.textTheme.titleLarge,
//                 ),
//                 const Spacer(),
//                 // TODO(dev): Use model instead.
//                 Text(
//                   widget.ticketPrice!,
//                   style: context.themeData.textTheme.titleLarge,
//                 ),
//               ],
//             ),
//           const SizedBox(height: CommonDimensions.small),
//           Divider(color: context.theme.dividerColor),
//           const SizedBox(height: CommonDimensions.small),
//           if (widget.ticketPrice != null)
//             Row(
//               children: [
//                 Text(
//                   context.locale.total,
//                   style: context.themeData.textTheme.titleLarge?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const Spacer(),
//                 Text(
//                   // TODO(dev): Use model instead.
//                   widget.ticketPrice!,
//                   style: context.themeData.textTheme.titleLarge,
//                 ),
//               ],
//             ),
//           const SizedBox(height: CommonDimensions.small),
//         ].insertBetween(
//           const SizedBox(height: CommonDimensions.medium),
//         ),
//       ),
//     );
//   }
// }

import 'package:common/avtovas_common.dart';
import 'package:common/src/widgets/common_support_methods/common_support_methods.dart';
import 'package:common/src/widgets/ticketing/passenger_citizenship_sheet.dart';
import 'package:common/src/widgets/ticketing/passenger_date_picker_sheet.dart';
import 'package:common/src/widgets/ticketing/passenger_document_type_sheet.dart';
import 'package:common/src/widgets/ticketing/passenger_rate_sheet.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

typedef PassengerChanged = void Function({
  String? ticketNumber,
  String? seatNum,
  String? fareName,
  String? firstName,
  String? lastName,
  String? surname,
  String? documentNum,
  String? documentType,
  String? dateOfBirth,
  String? gender,
  String? citizenship,
  String? rate,
});

final class PassengerCollapsedContainer extends StatefulWidget {
  final ValueChanged<bool> onSurnameVisibleChanged;
  final PassengerChanged onPassengerChanged;
  final PersonalData personalData;
  final bool noSurname;

  const PassengerCollapsedContainer({
    required this.onSurnameVisibleChanged,
    required this.onPassengerChanged,
    required this.personalData,
    required this.noSurname,
    super.key,
  });

  @override
  State<PassengerCollapsedContainer> createState() =>
      _PassengerCollapsedContainerState();
}

class _PassengerCollapsedContainerState
    extends State<PassengerCollapsedContainer> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _documentDataController;
  late final MaskedTextController _dateController;
  late final TextEditingController _citizenshipController;
  late final TextEditingController _documentTypeController;
  late final TextEditingController _rateController;

  var _isGenderClear = false;

  late final GlobalKey<FormState> _firstNameKey;
  late final GlobalKey<FormState> _lastNameKey;
  late final GlobalKey<FormState> _surnameKey;
  late final GlobalKey<FormState> _birthdayDateKey;
  late final GlobalKey<FormState> _citizenshipKey;
  late final GlobalKey<FormState> _documentTypeKey;
  late final GlobalKey<FormState> _documentDataKey;
  late final GlobalKey<FormState> _rateKey;

  // final birthdayDate = DateTime.tryParse(widget.personalData.dateOfBirth);
  late DateTime birthdayDate;

  @override
  void initState() {
    super.initState();

    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _surnameController = TextEditingController();
    _documentDataController = TextEditingController();
    _dateController = MaskedTextController(
      mask: '0000-00-00',
    );
    _citizenshipController = TextEditingController();
    _documentTypeController = TextEditingController();
    _rateController = TextEditingController();

    _fillControllers();

    _firstNameKey = GlobalKey<FormState>();
    _lastNameKey = GlobalKey<FormState>();
    _surnameKey = GlobalKey<FormState>();
    _birthdayDateKey = GlobalKey<FormState>();
    _citizenshipKey = GlobalKey<FormState>();
    _documentTypeKey = GlobalKey<FormState>();
    _documentDataKey = GlobalKey<FormState>();
    _rateKey = GlobalKey<FormState>();

    birthdayDate =
        DateTime.tryParse(widget.personalData.dateOfBirth) ?? DateTime.now();
  }

  void _onGenderChanged(BuildContext context, Genders gender) {
    setState(() => _isGenderClear = false);
    widget.onPassengerChanged(
      gender:
          gender == Genders.male ? context.locale.male : context.locale.female,
    );
  }

  bool _isValid() {
    final validates = <bool>[
      _firstNameKey.currentState!.validate(),
      _lastNameKey.currentState!.validate(),
      _surnameKey.currentState!.validate(),
      _birthdayDateKey.currentState!.validate(),
      _citizenshipKey.currentState!.validate(),
      _documentTypeKey.currentState!.validate(),
      _documentDataKey.currentState!.validate(),
      _rateKey.currentState!.validate(),
    ];

    if (widget.personalData.gender.isEmpty) {
      setState(() => _isGenderClear = true);
    }

    return validates.contains(false) || _isGenderClear;
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

  void _fillControllers() {
    final currentPersonalData = widget.personalData;

    _fillController(_firstNameController, currentPersonalData.firstName);
    _fillController(_lastNameController, currentPersonalData.lastName);
    _fillController(_surnameController, currentPersonalData.surname ?? '');
    _fillController(
      _dateController,
      birthdayDate.isAfter(DateTime.now())
          ? ''
          : birthdayDate.requestDateFormat(),
    );
    _fillController(_citizenshipController, currentPersonalData.citizenship);
    _fillController(_documentTypeController, currentPersonalData.documentType);
    _fillController(_documentDataController, currentPersonalData.documentNum);
    _fillController(_rateController, currentPersonalData.rate);
  }

  void _clearControllers() {
    _firstNameController.clear();
    _lastNameController.clear();
    _surnameController.clear();
    _dateController.clear();
    _citizenshipController.clear();
    _documentTypeController.clear();
    _documentDataController.clear();
    _rateController.clear();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _surnameController.dispose();
    _documentDataController.dispose();
    _dateController.dispose();
    _citizenshipController.dispose();
    _documentTypeController.dispose();
    _rateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TicketingContainer(
      margin: const EdgeInsets.all(CommonDimensions.large),
      child: Column(
        children: <Widget>[
          _PassengerValidatorInputField(
            controller: _firstNameController,
            formKey: _firstNameKey,
            fieldTitle: context.locale.firstName,
            onValueChanged: (value) => widget.onPassengerChanged(
              firstName: value,
            ),
          ),
          _PassengerValidatorInputField(
            controller: _lastNameController,
            formKey: _lastNameKey,
            fieldTitle: context.locale.lastName,
            onValueChanged: (value) => widget.onPassengerChanged(
              lastName: value,
            ),
          ),
          AnimatedSizedBox(
            toHeight: widget.noSurname ? CommonDimensions.none : null,
            child: _PassengerValidatorInputField(
              controller: _surnameController,
              validator: (value) {
                if (!widget.noSurname && value != null && value.isEmpty) {
                  return 'Поле должно быть заполнено';
                }

                return null;
              },
              formKey: _surnameKey,
              fieldTitle: context.locale.surname,
              onValueChanged: (value) => widget.onPassengerChanged(
                surname: value,
              ),
            ),
          ),
          AvtovasCheckbox(
            onChanged: (value) => widget.onSurnameVisibleChanged(value!),
            value: widget.noSurname,
            checkboxText: context.locale.noSurname,
          ),
          GenderSwitcher(
            onGenderChanged: (value) => _onGenderChanged(context, value),
            selectedGender: widget.personalData.gender.isEmpty
                ? null
                : widget.personalData.gender == context.locale.male
                    ? Genders.male
                    : Genders.female,
            isError: _isGenderClear,
          ),
          _PassengerValidatorInputField(
            controller: _dateController,
            formKey: _birthdayDateKey,
            fieldTitle: context.locale.birthdayDate,
            readOnly: true,
            onTap: () => CommonSupportMethods.showAvtovasBottomSheet(
              context: context,
              useCloseButton: false,
              child: PassengerDatePickerSheet(
                onBirthdayDateChanged: (value) {
                  _birthdayDateKey.currentState?.reset();
                  widget.onPassengerChanged(dateOfBirth: value.toString());
                },
                initialDate: birthdayDate,
              ),
            ),
          ),
          _PassengerValidatorInputField(
            controller: _citizenshipController,
            formKey: _citizenshipKey,
            fieldTitle: context.locale.citizenship,
            readOnly: true,
            onTap: () => CommonSupportMethods.showAvtovasBottomSheet(
              context: context,
              child: PassengerCitizenshipSheet(
                onCitizenshipChanged: (value) {
                  _citizenshipKey.currentState?.reset();
                  widget.onPassengerChanged(citizenship: value);
                },
                selectedCountry: widget.personalData.citizenship,
              ),
            ),
          ),
          _PassengerValidatorInputField(
            controller: _documentTypeController,
            formKey: _documentTypeKey,
            fieldTitle: context.locale.document,
            readOnly: true,
            onTap: () => CommonSupportMethods.showAvtovasBottomSheet(
              context: context,
              child: PassengerDocumentTypeSheet(
                onDocumentTypeChanged: (value) {
                  _documentTypeKey.currentState?.reset();
                  widget.onPassengerChanged(documentType: value);
                },
                selectedDocumentType: widget.personalData.documentType,
              ),
            ),
          ),
          _PassengerValidatorInputField(
            controller: _documentDataController,
            formKey: _documentDataKey,
            fieldTitle: context.locale.seriesAndNumber,
            onValueChanged: (value) => widget.onPassengerChanged(
              documentNum: value,
            ),
          ),
          _PassengerValidatorInputField(
            controller: _rateController,
            formKey: _rateKey,
            fieldTitle: context.locale.rate,
            readOnly: true,
            onTap: () => CommonSupportMethods.showAvtovasBottomSheet(
              context: context,
              child: PassengerRateSheet(
                onRateChanged: (value) {
                  _rateKey.currentState?.reset();
                  widget.onPassengerChanged(rate: value);
                },
                selectedRate: widget.personalData.rate,
              ),
            ),
          ),
        ].insertBetween(
          const SizedBox(height: CommonDimensions.medium),
        ),
      ),
    );
  }
}

final class _PassengerValidatorInputField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool readOnly;
  final String fieldTitle;
  final VoidCallback? onTap;
  final ValueChanged<String>? onValueChanged;

  const _PassengerValidatorInputField({
    required this.formKey,
    required this.fieldTitle,
    this.controller,
    this.readOnly = false,
    this.validator,
    this.onTap,
    this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    const maxLines = 1;

    return InputField(
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
          formKey.currentState!.validate();
        }

        onValueChanged?.call(value);
      },
    );
  }
}
