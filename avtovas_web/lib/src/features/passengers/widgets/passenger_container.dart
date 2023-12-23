import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_web/src/features/passengers/widgets/passenger_citizenship_sheet.dart';
import 'package:avtovas_web/src/features/passengers/widgets/passenger_date_picker_sheet.dart';
import 'package:avtovas_web/src/features/passengers/widgets/passenger_document_type_sheet.dart';
import 'package:avtovas_web/src/features/passengers/widgets/passenger_rate_sheet.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_utils_widgets.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
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
});

final class PassengerContainer extends StatefulWidget {
  final VoidCallback updatePassengers;
  final VoidCallback? removePassenger;
  final VoidCallback onClose;
  final ValueChanged<bool> onSurnameVisibleChanged;
  final PassengerChanged onPassengerChanged;
  final PassengersState state;

  const PassengerContainer({
    required this.state,
    required this.removePassenger,
    required this.updatePassengers,
    required this.onClose,
    required this.onSurnameVisibleChanged,
    required this.onPassengerChanged,
    super.key,
  });

  @override
  State<PassengerContainer> createState() => _PassengerContainerState();
}

class _PassengerContainerState extends State<PassengerContainer> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _dateController;
  late final TextEditingController _citizenshipController;
  late final TextEditingController _documentTypeController;
  late final MaskedTextController _maskedDocumentDataController;

  var _isGenderClear = false;

  late final GlobalKey<FormState> _firstNameKey;
  late final GlobalKey<FormState> _lastNameKey;
  late final GlobalKey<FormState> _surnameKey;
  late final GlobalKey<FormState> _birthdayDateKey;
  late final GlobalKey<FormState> _citizenshipKey;
  late final GlobalKey<FormState> _documentTypeKey;
  late final GlobalKey<FormState> _documentDataKey;

  @override
  void initState() {
    super.initState();

    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _surnameController = TextEditingController();
    _dateController = TextEditingController();
    _citizenshipController = TextEditingController();
    _documentTypeController = TextEditingController();
    _maskedDocumentDataController = MaskedTextController(mask: '');

    _fillControllers();

    _firstNameKey = GlobalKey<FormState>();
    _lastNameKey = GlobalKey<FormState>();
    _surnameKey = GlobalKey<FormState>();
    _birthdayDateKey = GlobalKey<FormState>();
    _citizenshipKey = GlobalKey<FormState>();
    _documentTypeKey = GlobalKey<FormState>();
    _documentDataKey = GlobalKey<FormState>();
  }

  @override
  void didUpdateWidget(covariant PassengerContainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    _fillControllers();

    if (!widget.state.canRenderFillContainer) {
      _clearControllers();
      FocusScope.of(context).unfocus();
    }
  }

  Future<void> _showDialog(
    BuildContext context,
    String dialogTitle,
    VoidCallback action,
  ) {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (context) {
        return AvtovasAlertDialog(
          title: dialogTitle,
          okayCallback: action,
        );
      },
    );
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
    ];

    if (widget.state.currentPassenger.gender.isEmpty) {
      setState(() => _isGenderClear = true);
    }

    return validates.contains(false) || _isGenderClear;
  }

  void _onSubmitTap() {
    if (!_isValid()) {
      widget
        ..updatePassengers()
        ..onClose();
    }
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

  void _fillDocumentDataMask(BuildContext context) {
    final documentDataFormatMask = TextInputFormatters.documentDataFormatter(
      context,
      widget.state.currentPassenger.documentType,
    );

    if (_maskedDocumentDataController.mask != documentDataFormatMask.mask) {
      _maskedDocumentDataController
        ..mask = documentDataFormatMask.mask
        ..translator = documentDataFormatMask.filter;
    }

    _maskedDocumentDataController.text =
        widget.state.currentPassenger.documentData;
  }

  void _fillControllers() {
    final currentPassenger = widget.state.currentPassenger;

    _fillController(_firstNameController, currentPassenger.firstName);
    _fillController(_lastNameController, currentPassenger.lastName);
    _fillController(_surnameController, currentPassenger.surname ?? '');
    _fillController(
      _dateController,
      currentPassenger.birthdayDate.isAfter(DateTime.now())
          ? ''
          : currentPassenger.birthdayDate.viewDateFormat(),
    );
    _fillController(_citizenshipController, currentPassenger.citizenship);
    _fillController(_documentTypeController, currentPassenger.documentType);

    Future.delayed(Duration.zero, () => _fillDocumentDataMask(context));
  }

  void _clearControllers() {
    _firstNameController.clear();
    _lastNameController.clear();
    _surnameController.clear();
    _dateController.clear();
    _citizenshipController.clear();
    _documentTypeController.clear();
    _maskedDocumentDataController.clear();
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final documentType = widget.state.currentPassenger.documentType;

    return TicketingContainer(
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.large),
      child: Column(
        children: <Widget>[
          _PassengerValidatorInputField(
            controller: _lastNameController,
            formKey: _lastNameKey,
            fieldTitle: context.locale.lastName,
            onValueChanged: (value) => widget.onPassengerChanged(
              lastName: value,
            ),
          ),
          _PassengerValidatorInputField(
            controller: _firstNameController,
            formKey: _firstNameKey,
            fieldTitle: context.locale.firstName,
            onValueChanged: (value) => widget.onPassengerChanged(
              firstName: value,
            ),
          ),
          AnimatedSizedBox(
            toHeight: widget.state.noSurname ? AppDimensions.none : null,
            child: _PassengerValidatorInputField(
              controller: _surnameController,
              validator: (value) {
                if (!widget.state.noSurname && value != null && value.isEmpty) {
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
            value: widget.state.noSurname,
            checkboxText: context.locale.noSurname,
          ),
          GenderSwitcher(
            onGenderChanged: (value) => _onGenderChanged(context, value),
            selectedGender: widget.state.currentPassenger.gender.isEmpty
                ? null
                : widget.state.currentPassenger.gender == context.locale.male
                    ? Genders.male
                    : Genders.female,
            isError: _isGenderClear,
          ),
          _PassengerValidatorInputField(
            controller: _dateController,
            formKey: _birthdayDateKey,
            fieldTitle: context.locale.birthdayDate,
            readOnly: true,
            onTap: () => SupportMethods.showAvtovasBottomSheet(
              context: context,
              useCloseButton: false,
              child: PassengerDatePickerSheet(
                onBirthdayDateChanged: (value) {
                  _birthdayDateKey.currentState?.reset();
                  widget.onPassengerChanged(birthdayDate: value);
                },
                initialDate: widget.state.currentPassenger.birthdayDate,
              ),
            ),
          ),
          _PassengerValidatorInputField(
            controller: _citizenshipController,
            formKey: _citizenshipKey,
            fieldTitle: context.locale.citizenship,
            readOnly: true,
            onTap: () => SupportMethods.showAvtovasBottomSheet(
              context: context,
              child: PassengerCitizenshipSheet(
                onCitizenshipChanged: (value) {
                  _citizenshipKey.currentState?.reset();
                  widget.onPassengerChanged(citizenship: value);
                },
                selectedCountry: widget.state.currentPassenger.citizenship,
              ),
            ),
          ),
          _PassengerValidatorInputField(
            controller: _documentTypeController,
            formKey: _documentTypeKey,
            fieldTitle: context.locale.document,
            readOnly: true,
            onTap: () => SupportMethods.showAvtovasBottomSheet(
              context: context,
              child: PassengerDocumentTypeSheet(
                onDocumentTypeChanged: (value) {
                  _documentTypeKey.currentState?.reset();
                  widget.onPassengerChanged(documentType: value);
                },
                selectedDocumentType:
                    widget.state.currentPassenger.documentType,
              ),
            ),
          ),
          _PassengerValidatorInputField(
            controller: _maskedDocumentDataController,
            formKey: _documentDataKey,
            fieldTitle: documentType ==
                        DocumentTypes.documentTypes(context).first ||
                    documentType == DocumentTypes.documentTypes(context)[2] ||
                    documentType == DocumentTypes.documentTypes(context)[3] ||
                    documentType == DocumentTypes.documentTypes(context)[1]
                ? context.locale.seriesAndNumber
                : context.locale.number,
            onValueChanged: (value) => widget.onPassengerChanged(
              documentData: value,
            ),
          ),
          const SizedBox(height: AppDimensions.large),
          Row(
            children: [
              if (!widget.state.isNewPassenger) ...[
                Expanded(
                  child: AvtovasButton.text(
                    buttonText: 'Удалить',
                    onTap: () => _showDialog(
                      context,
                      'Вы уверены, что хотите удалить этого пассажира?',
                      () => widget
                        ..removePassenger?.call()
                        ..onClose(),
                    ),
                    padding: const EdgeInsets.all(AppDimensions.mediumLarge),
                  ),
                ),
                const SizedBox(width: AppDimensions.medium),
              ],
              Expanded(
                child: AvtovasButton.text(
                  buttonText:
                      widget.state.isNewPassenger ? 'Добавить' : 'Сохранить',
                  onTap: () => _showDialog(
                    context,
                    widget.state.isNewPassenger
                        ? 'Вы уверены, что хотите добавить этого пассажира?'
                        : 'Вы уверены, что хотите изменить этого пассажира?',
                    _onSubmitTap,
                  ),
                  padding: const EdgeInsets.all(AppDimensions.mediumLarge),
                ),
              ),
            ],
          ),
        ].insertBetween(
          const SizedBox(height: AppDimensions.medium),
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
