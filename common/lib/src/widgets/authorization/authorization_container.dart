import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:common/src/widgets/input_field/phone_input_field.dart';
import 'package:flutter/material.dart';

final class AuthorizationContainer extends StatefulWidget {
  final ValueChanged<String> onNumberChanged;
  final VoidCallback onSendButtonTap;
  final VoidCallback onTextTap;

  const AuthorizationContainer({
    required this.onNumberChanged,
    required this.onSendButtonTap,
    required this.onTextTap,
    super.key,
  });

  @override
  State<AuthorizationContainer> createState() => _AuthorizationContainerState();
}

class _AuthorizationContainerState extends State<AuthorizationContainer> {
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();
  }

  void _validate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.reset();
      _showDialog();
    }
  }

  Future<void> _showDialog() async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Подтверждение'),
          content: const Text(
            'Вы уверены, что хотите продолжить с номером +375 (29) 151-58-60',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Выбрать другой номер'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Да'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: CommonDimensions.extraLarge,
      ),
      child: Column(
        children: [
          Text(
            'Войти в личный кабинет',
            style: context.themeData.textTheme.headlineLarge?.copyWith(
              fontSize: CommonFonts.sizeDisplayMedium,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: CommonDimensions.large),
          Text(
            'Вам будут доступны операции со всеми билетами, которые вы покупали на этот номер',
            style: context.themeData.textTheme.bodyLarge?.copyWith(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: CommonDimensions.extraLarge),
          PhoneInputField(
            onPhoneChanged: (value) {},
            formKey: _formKey,
          ),
          const SizedBox(height: CommonDimensions.large),
          const Text(
            'Продолжая, вы соглашаетесь со сбором и обработкой персональных данных',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: CommonDimensions.extraLarge),
          AvtovasButton.text(
            buttonText: 'Выслать код в СМС',
            onTap: _validate,
            padding: const EdgeInsets.all(CommonDimensions.large),
          ),
        ],
      ),
    );
  }
}
