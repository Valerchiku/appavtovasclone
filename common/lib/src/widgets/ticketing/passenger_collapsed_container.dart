import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:common/src/widgets/input_field/input_field.dart';
import 'package:common/src/widgets/ticketing/gender_switcher.dart';
import 'package:common/src/widgets/ticketing/ticketing_container.dart';
import 'package:common/src/widgets/utils_widgets/avtovas_checkbox.dart';
import 'package:flutter/material.dart';

final class PassengerCollapsedContainer extends StatelessWidget {
  final ValueChanged<Genders> onGenderChanged;
  final ValueChanged<bool?> onSurnameVisibleChanged;
  final Genders selectedGender;
  final bool isSurnameVisible;

  const PassengerCollapsedContainer({
    required this.onGenderChanged,
    required this.onSurnameVisibleChanged,
    required this.selectedGender,
    required this.isSurnameVisible,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TicketingContainer(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text(
                'Пассажир 1',
                style: context.themeData.textTheme.titleLarge?.copyWith(
                  fontSize: CommonFonts.sizeHeadlineMedium,
                ),
              ),
              const Spacer(),
              AvtovasButton.icon(
                buttonText: 'Выбрать пассажира',
                backgroundOpacity: 0,
                textStyle: context.themeData.textTheme.titleLarge?.copyWith(
                  color: context.theme.primaryTextColor,
                ),
                svgPath: ImagesAssets.personIcon,
                buttonColor: context.theme.transparent,
                onTap: () {},
              ),
            ],
          ),
          const InputField(
            hintText: 'Имя',
            fieldTitle: 'Имя',
          ),
          const InputField(
            hintText: 'Фамилия',
            fieldTitle: 'Фамилия',
          ),
          AnimatedSizedBox(
            toHeight: isSurnameVisible ? null : CommonDimensions.none,
            child: const InputField(
              hintText: 'Отчество',
              fieldTitle: 'Отчество',
            ),
          ),
          AvtovasCheckbox(
            onChanged: onSurnameVisibleChanged,
            value: isSurnameVisible,
            checkboxText: 'Нет отчества',
          ),
          const Text('Пол'),
          GenderSwitcher(
            onGenderChanged: onGenderChanged,
            selectedGender: selectedGender,
          ),
        ].insertBetween(
          const SizedBox(height: CommonDimensions.medium),
        ),
      ),
    );
  }
}
