import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/list_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class CodeAuthenticator extends StatefulWidget {
  final ValueChanged<String> onCodeEntered;

  const CodeAuthenticator({
    required this.onCodeEntered,
    super.key,
  });

  @override
  State<CodeAuthenticator> createState() => _CodeAuthenticatorState();
}

class _CodeAuthenticatorState extends State<CodeAuthenticator> {
  static const int _length = 4;

  late final List<FocusNode> _focusNodes;
  late final List<TextEditingController> _controllers;
  late final List<bool> _fieldsValid;

  @override
  void initState() {
    super.initState();

    _focusNodes = List.generate(_length, (_) => FocusNode());
    _controllers = List.generate(_length, (_) => TextEditingController());
    _fieldsValid = List.generate(_length, (_) => true);

    if (_focusNodes.length != _length &&
        _controllers.length != _length &&
        _fieldsValid.length != _length) {
      throw RangeError(
        'The number of controllers must be equal to the number of focusNodes',
      );
    }

    Future.delayed(Duration.zero, () => _focusNodes.first.requestFocus());
  }

  void _onPasscodeEntered(String value, int index) {
    final allFieldsNotEmpty = !_controllers.any(
      (controller) => controller.text.isEmpty,
    );

    if (allFieldsNotEmpty) {
      _validateAndSubmitCode();
      return;
    }

    if (value.isNotEmpty) {
      setState(() => _fieldsValid[index] = true);
      if (index != _focusNodes.length - 1) {
        _focusNodes[index].nextFocus();
      } else {
        for (var i = 0; i < _length; i++) {
          if (_controllers[i].text.isEmpty) {
            setState(() => _fieldsValid[i] = false);
          }
        }
        if (!_fieldsValid.contains(false)) {
          _validateAndSubmitCode();
        }
      }
    } else {
      for (var i = 0; i < _length; i++) {
        _controllers[i].text = '';
        setState(() => _fieldsValid[i] = true);
      }
      _focusNodes.first.requestFocus();
    }
  }

  void _validateAndSubmitCode() {
    for (var i = 0; i < _length; i++) {
      setState(() => _fieldsValid[i] = true);
    }
    final enteredCode =
        _controllers.map((controller) => controller.text).join();
    if (enteredCode.length == _length) {
      widget.onCodeEntered(enteredCode);
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void dispose() {
    for (var i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].dispose();
      _controllers[i].dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var index = 0; index < _focusNodes.length; index++)
              _CodeField(
                isValid: _fieldsValid[index],
                fieldIndex: index,
                maxFields: _focusNodes.length,
                textEditingController: _controllers[index],
                focusNode: _focusNodes[index],
                onCodeChanged: (value) => _onPasscodeEntered(value, index),
              ),
          ].insertBetween(
            const SizedBox(width: CommonDimensions.medium),
          ),
        ),
      ],
    );
  }
}

final class _CodeField extends StatelessWidget {
  final bool isValid;
  final int fieldIndex;
  final int maxFields;
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final ValueChanged<String> onCodeChanged;

  const _CodeField({
    required this.fieldIndex,
    required this.isValid,
    required this.maxFields,
    required this.focusNode,
    required this.textEditingController,
    required this.onCodeChanged,
  });

  @override
  Widget build(BuildContext context) {
    const maxLength = 1;

    return AnimatedContainer(
      width: CommonDimensions.codeFieldSize,
      height: CommonDimensions.codeFieldSize,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: const BorderRadius.all(
          Radius.circular(CommonDimensions.medium),
        ),
        border: isValid
            ? null
            : const Border.fromBorderSide(
                BorderSide(color: Colors.red),
              ),
      ),
      child: TextFormField(
        controller: textEditingController,
        focusNode: focusNode,
        onChanged: onCodeChanged,
        textAlign: TextAlign.center,
        inputFormatters: const [
          _IntegerInputFormatter(),
        ],
        maxLength: maxLength,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            // Задаем красный бордер для ошибки
            borderRadius:
                BorderRadius.all(Radius.circular(CommonDimensions.medium)),
          ),
          border: InputBorder.none,
          counterText: '',
        ),
      ),
    );
  }
}

class _IntegerInputFormatter extends TextInputFormatter {
  const _IntegerInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final regExp = RegExp(r'^\d+');
    final matches = regExp.allMatches(newValue.text);
    final filteredValue = matches.map((match) => match.group(0)).join();

    return TextEditingValue(
      text: filteredValue,
      selection: TextSelection.collapsed(offset: filteredValue.length),
    );
  }
}
