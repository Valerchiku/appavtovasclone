// ignore_for_file: unused_import

import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

final class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const InputField({
    required this.hintText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;

    return TextField(
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
        // Позже добавлю в text_theme , пока не очень понял как это реализовать)
        hintStyle: TextStyle(
          fontSize: CommonFonts.sizeHeadlineSmall,
          color: colorPath.assistiveTextColor,
          fontWeight: FontWeight.w400,
          height: CommonFonts.sizeFactorLarge,
        ),
      ),
    );
  }
}
