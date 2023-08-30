import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/features/passengers/utils/sheet_types.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

final class PassengerContainer extends StatefulWidget {
  final bool isNewPassenger;
  final VoidCallback updatePassengers;
  final VoidCallback? removePassenger;
  final VoidCallback onClose;
  final ValueChanged<bool> onSurnameVisibleChanged;
  final ValueChanged<PassengerSheetTypes> onSheetTypeChanged;
  final bool noSurname;
  final ValueChanged<String> onGenderChanged;
  final ValueChanged<String> onFirstNameChanged;
  final ValueChanged<String> onLastNameChanged;
  final ValueChanged<String> onSurnameChanged;
  final ValueChanged<String> onSeriesAndNumberChanged;
  final String selectedGender;
  final String firstNameInitial;
  final String lastNameInitial;
  final String? surnameInitial;
  final String birthdayInitial;
  final String citizenshipInitial;
  final String documentTypeInitial;
  final String documentDataInitial;
  final String rateInitial;

  const PassengerContainer({
    required this.isNewPassenger,
    required this.removePassenger,
    required this.updatePassengers,
    required this.onClose,
    required this.onSurnameVisibleChanged,
    required this.onSheetTypeChanged,
    required this.noSurname,
    required this.onGenderChanged,
    required this.onFirstNameChanged,
    required this.onLastNameChanged,
    required this.onSurnameChanged,
    required this.onSeriesAndNumberChanged,
    required this.selectedGender,
    required this.firstNameInitial,
    required this.lastNameInitial,
    required this.surnameInitial,
    required this.birthdayInitial,
    required this.citizenshipInitial,
    required this.documentTypeInitial,
    required this.documentDataInitial,
    required this.rateInitial,
    super.key,
  });

  @override
  State<PassengerContainer> createState() => _PassengerContainerState();
}

class _PassengerContainerState extends State<PassengerContainer> {
  var _isGenderClear = false;
  late final MaskedTextController _dateController;

  late final GlobalKey<FormState> _firstNameKey;
  late final GlobalKey<FormState> _lastNameKey;
  late final GlobalKey<FormState> _surnameKey;
  late final GlobalKey<FormState> _birthdayDateKey;
  late final GlobalKey<FormState> _citizenshipKey;
  late final GlobalKey<FormState> _documentTypeKey;
  late final GlobalKey<FormState> _seriesAndNumberKey;
  late final GlobalKey<FormState> _rateKey;

  @override
  void initState() {
    super.initState();

    _dateController = MaskedTextController(
      mask: '0000-00-00',
      text: widget.birthdayInitial,
    );

    _firstNameKey = GlobalKey<FormState>();
    _lastNameKey = GlobalKey<FormState>();
    _surnameKey = GlobalKey<FormState>();
    _birthdayDateKey = GlobalKey<FormState>();
    _citizenshipKey = GlobalKey<FormState>();
    _documentTypeKey = GlobalKey<FormState>();
    _seriesAndNumberKey = GlobalKey<FormState>();
    _rateKey = GlobalKey<FormState>();
  }

  void _onGenderChanged(BuildContext context, Genders gender) {
    setState(() => _isGenderClear = false);
    widget.onGenderChanged(
      gender == Genders.male ? context.locale.male : context.locale.female,
    );
  }

  void _validate() {
    final validates = <bool>[
      _firstNameKey.currentState!.validate(),
      _lastNameKey.currentState!.validate(),
      _surnameKey.currentState!.validate(),
      _birthdayDateKey.currentState!.validate(),
      _citizenshipKey.currentState!.validate(),
      _documentTypeKey.currentState!.validate(),
      _seriesAndNumberKey.currentState!.validate(),
      _rateKey.currentState!.validate(),
    ];

    if (widget.selectedGender.isEmpty) {
      setState(() => _isGenderClear = true);
    }

    if (!validates.contains(false)) {
      widget
        ..updatePassengers()
        ..onClose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TicketingContainer(
      child: Column(
        children: <Widget>[
          _PassengerValidatorInputField(
            formKey: _firstNameKey,
            initialValue: widget.firstNameInitial,
            fieldTitle: context.locale.firstName,
            onValueChanged: widget.onFirstNameChanged,
          ),
          _PassengerValidatorInputField(
            formKey: _lastNameKey,
            initialValue: widget.lastNameInitial,
            fieldTitle: context.locale.lastName,
            onValueChanged: widget.onLastNameChanged,
          ),
          AnimatedSizedBox(
            toHeight: widget.noSurname ? AppDimensions.none : null,
            child: _PassengerValidatorInputField(
              validator: (value) {
                if (!widget.noSurname && value != null && value.isEmpty) {
                  return 'Поле должно быть заполнено';
                }

                return null;
              },
              formKey: _surnameKey,
              initialValue: widget.surnameInitial,
              fieldTitle: context.locale.surname,
              onValueChanged: widget.onSurnameChanged,
            ),
          ),
          AvtovasCheckbox(
            onChanged: (value) => widget.onSurnameVisibleChanged(value!),
            value: widget.noSurname,
            checkboxText: context.locale.noSurname,
          ),
          GenderSwitcher(
            onGenderChanged: (value) => _onGenderChanged(context, value),
            selectedGender: widget.selectedGender.isEmpty
                ? null
                : widget.selectedGender == context.locale.male
                    ? Genders.male
                    : Genders.female,
            isError: _isGenderClear,
          ),
          _PassengerValidatorInputField(
            controller: _dateController,
            formKey: _birthdayDateKey,
            fieldTitle: context.locale.birthdayDate,
            readOnly: true,
            onTap: () => widget.onSheetTypeChanged(
              PassengerSheetTypes.datePicker,
            ),
          ),
          _PassengerValidatorInputField(
            formKey: _citizenshipKey,
            fieldTitle: context.locale.citizenship,
            initialValue: widget.citizenshipInitial,
            readOnly: true,
            onTap: () => widget.onSheetTypeChanged(
              PassengerSheetTypes.citizenship,
            ),
          ),
          _PassengerValidatorInputField(
            formKey: _documentTypeKey,
            fieldTitle: context.locale.document,
            initialValue: widget.documentTypeInitial,
            readOnly: true,
            onTap: () => widget.onSheetTypeChanged(
              PassengerSheetTypes.document,
            ),
          ),
          _PassengerValidatorInputField(
            formKey: _seriesAndNumberKey,
            fieldTitle: context.locale.seriesAndNumber,
            initialValue: widget.documentDataInitial,
            onValueChanged: widget.onSeriesAndNumberChanged,
          ),
          _PassengerValidatorInputField(
            formKey: _rateKey,
            fieldTitle: context.locale.rate,
            initialValue: widget.rateInitial,
            readOnly: true,
            onTap: () => widget.onSheetTypeChanged(
              PassengerSheetTypes.rate,
            ),
          ),
          Row(
            children: [
              if (!widget.isNewPassenger) ...[
                Expanded(
                  child: AvtovasButton.text(
                    buttonText: 'Удалить',
                    onTap: () {
                      widget
                        ..removePassenger?.call()
                        ..onClose();
                    },
                    padding: const EdgeInsets.all(AppDimensions.mediumLarge),
                  ),
                ),
                const SizedBox(width: AppDimensions.medium),
              ],
              Expanded(
                child: AvtovasButton.text(
                  buttonText: widget.isNewPassenger ? 'Добавить' : 'Сохранить',
                  onTap: _validate,
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
  final String? initialValue;

  const _PassengerValidatorInputField({
    required this.formKey,
    required this.fieldTitle,
    this.initialValue,
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
      initialValue: initialValue,
    );
  }
}
