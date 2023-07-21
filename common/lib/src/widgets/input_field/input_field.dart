// ignore_for_file: unused_import

import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

final class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String fieldTitle;
  final String hintText;
  const InputField({
    required this.hintText,
    required this.fieldTitle,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themePath = context.themeData.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldTitle,
          style: themePath.titleSmall?.copyWith(
            color: context.theme.secondaryTextColor,
          ),
        ),
        const SizedBox(height: CommonDimensions.small),
        TextField(
          controller: controller,
          cursorColor: colorPath.mainAppColor,
          decoration: InputDecoration(
            filled: true,
            fillColor: colorPath.whitespaceContainerColor,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: AvtovasPlatform.isWeb
                  ? BorderSide(color: colorPath.assistiveTextColor)
                  : BorderSide(color: colorPath.whitespaceContainerColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: AvtovasPlatform.isWeb
                  ? BorderSide(color: colorPath.assistiveTextColor)
                  : BorderSide(color: colorPath.whitespaceContainerColor),
            ),
            hintText: hintText,
            hintStyle: themePath.titleLarge?.copyWith(
              color: context.theme.assistiveTextColor,
              height: CommonFonts.sizeFactorLarge,
            ),
          ),
        ),
      ],
    );
  }
}
