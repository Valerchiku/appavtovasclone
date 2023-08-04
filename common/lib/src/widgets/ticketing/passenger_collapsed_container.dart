import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:common/src/widgets/input_field/input_field.dart';
import 'package:common/src/widgets/ticketing/gender_switcher.dart';
import 'package:common/src/widgets/ticketing/ticketing_container.dart';
import 'package:common/src/widgets/utils_widgets/avtovas_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

final class PassengerCollapsedContainer extends StatefulWidget {
  final ValueChanged<Genders> onGenderChanged;
  final ValueChanged<bool?> onSurnameVisibleChanged;
  final Genders selectedGender;
  final bool isSurnameVisible;

  const PassengerCollapsedContainer({
    required this.onGenderChanged,
    required this.onSurnameVisibleChanged,
    required this.isSurnameVisible,
    required this.selectedGender,
    super.key,
  });

  @override
  State<PassengerCollapsedContainer> createState() =>
      _PassengerCollapsedContainerState();
}

class _PassengerCollapsedContainerState
    extends State<PassengerCollapsedContainer> {
  late final MaskedTextController _dateController;

  @override
  void initState() {
    super.initState();

    _dateController = MaskedTextController(mask: '00.00.0000');
  }

  @override
  Widget build(BuildContext context) {
    return TicketingContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            toHeight: widget.isSurnameVisible ? CommonDimensions.none : null,
            child: const InputField(
              hintText: 'Отчество',
              fieldTitle: 'Отчество',
            ),
          ),
          AvtovasCheckbox(
            onChanged: widget.onSurnameVisibleChanged,
            value: widget.isSurnameVisible,
            checkboxText: 'Нет отчества',
          ),
          const Text('Пол'),
          GenderSwitcher(
            onGenderChanged: widget.onGenderChanged,
            selectedGender: widget.selectedGender,
          ),
          InputField(
            controller: _dateController,
            fieldTitle: 'Дата рождения',
            keyboardType: TextInputType.datetime,
            hintText: '__.__.____',
          ),

        ].insertBetween(
          const SizedBox(height: CommonDimensions.medium),
        ),
      ),
    );
  }
}
