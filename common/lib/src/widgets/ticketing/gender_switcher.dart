import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/widgets/ticketing/utils/genders.dart';
import 'package:flutter/material.dart';

final class GenderSwitcher extends StatelessWidget {
  final ValueChanged<Genders> onGenderChanged;
  final Genders selectedGender;

  const GenderSwitcher({
    required this.onGenderChanged,
    required this.selectedGender,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SwitcherElement(
            onGenderChanged: onGenderChanged,
            selectedGender: selectedGender,
            gender: Genders.male,
          ),
        ),
        const SizedBox(width: CommonDimensions.medium),
        Expanded(
          child: _SwitcherElement(
            onGenderChanged: onGenderChanged,
            selectedGender: selectedGender,
            gender: Genders.female,
          ),
        ),
      ],
    );
  }
}

final class _SwitcherElement extends StatelessWidget {
  final ValueChanged<Genders> onGenderChanged;
  final Genders selectedGender;
  final Genders gender;

  const _SwitcherElement({
    required this.onGenderChanged,
    required this.selectedGender,
    required this.gender,
  });

  String _genderByType() => switch (gender) {
        Genders.male => 'Мужской',
        Genders.female => 'Женский',
      };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onGenderChanged(gender),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.symmetric(
          horizontal: CommonDimensions.extraLarge,
          vertical: CommonDimensions.large,
        ),
        decoration: BoxDecoration(
          color: selectedGender == gender
              ? const Color(0xFFDADADA)
              : context.theme.whitespaceContainerColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(CommonDimensions.medium),
          ),
          border: const Border.fromBorderSide(
            BorderSide(
              color: Color(0xFFDADADA),
            ),
          ),
        ),
        child: Text(_genderByType()),
      ),
    );
  }
}
