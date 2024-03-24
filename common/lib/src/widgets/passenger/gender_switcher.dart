import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class GenderSwitcher extends StatelessWidget {
  final ValueChanged<Genders> onGenderChanged;
  final Genders? selectedGender;
  final bool isError;

  const GenderSwitcher({
    required this.onGenderChanged,
    required this.selectedGender,
    this.isError = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.locale.gender),
        const SizedBox(height: CommonDimensions.small),
        Row(
          children: [
            Expanded(
              child: _SwitcherElement(
                onGenderChanged: onGenderChanged,
                selectedGender: selectedGender,
                gender: Genders.male,
                isError: isError,
              ),
            ),
            const SizedBox(width: CommonDimensions.medium),
            Expanded(
              child: _SwitcherElement(
                onGenderChanged: onGenderChanged,
                selectedGender: selectedGender,
                gender: Genders.female,
                isError: isError,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

final class _SwitcherElement extends StatefulWidget {
  final ValueChanged<Genders> onGenderChanged;
  final Genders? selectedGender;
  final Genders gender;
  final bool isError;

  const _SwitcherElement({
    required this.onGenderChanged,
    required this.selectedGender,
    required this.gender,
    required this.isError,
  });

  @override
  State<_SwitcherElement> createState() => _SwitcherElementState();
}

class _SwitcherElementState extends State<_SwitcherElement> {
  String _genderByType(BuildContext context) => switch (widget.gender) {
        Genders.male => context.locale.male,
        Genders.female => context.locale.female,
      };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onGenderChanged(widget.gender),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.symmetric(
          horizontal: CommonDimensions.extraLarge,
          vertical: CommonDimensions.large,
        ),
        decoration: BoxDecoration(
          border: widget.isError
              ? Border.fromBorderSide(
                  BorderSide(color: context.theme.errorColor),
                )
              : null,
          color: widget.selectedGender == widget.gender
              ? const Color(0xFFDADADA)
              : context.theme.containerBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(CommonDimensions.medium),
          ),
        ),
        child: Center(
          child: Text(
            _genderByType(context),
          ),
        ),
      ),
    );
  }
}
