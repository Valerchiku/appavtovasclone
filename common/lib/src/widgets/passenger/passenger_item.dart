import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';

final class PassengerItem extends StatelessWidget {
  final VoidCallback onTap;
  final String passengerFirstName;
  final String passengerLastName;
  final String passengerGender;
  final String passengerBirthday;
  final String? passengerSurname;

  const PassengerItem({
    required this.onTap,
    required this.passengerFirstName,
    required this.passengerLastName,
    required this.passengerSurname,
    required this.passengerGender,
    required this.passengerBirthday,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(
        Radius.circular(CommonDimensions.medium),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CommonDimensions.large,
          vertical: CommonDimensions.small,
        ),
        child: Row(
          children: [
            const _PassengerIcon(),
            const SizedBox(width: CommonDimensions.large),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$passengerLastName '
                  '${passengerFirstName.characters.first.toUpperCase()}. '
                  '${passengerSurname == null
                      ? ''
                      : passengerSurname!.characters.first.toUpperCase()}.',
                  style: context.themeData.textTheme.titleLarge?.copyWith(
                    fontSize: CommonFonts.sizeHeadlineMedium,
                  ),
                ),
                Text(
                  '$passengerGender, $passengerBirthday',
                  style: context.themeData.textTheme.titleLarge?.copyWith(
                    fontSize: CommonFonts.sizeHeadlineMedium,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const AvtovasVectorImage(
              svgAssetPath: ImagesAssets.forwardArrowIcon,
            ),
          ],
        ),
      ),
    );
  }
}

final class _PassengerIcon extends StatelessWidget {
  const _PassengerIcon();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: CommonDimensions.checkBoxSize,
      backgroundColor: context.theme.dividerColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AvtovasVectorImage(
            color: context.theme.defaultIconColor,
            svgAssetPath: ImagesAssets.passengerSmallIcon,
            width: CommonDimensions.checkBoxSize,
            height: CommonDimensions.checkBoxSize,
          ),
        ],
      ),
    );
  }
}
