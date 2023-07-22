
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

// ignore_for_file: unused_import
// ignore_for_file: prefer-moving-to-variable
// ignore_for_file: comment_references
// ignore_for_file: lines_longer_than_80_chars

final class InputField extends StatelessWidget {
  final TextEditingController controller;

  final String hintText;

  /// By default, the value of {focusNode} is [null]
  final FocusNode? focusNode;

  /// By default, the value of {textCapitalization} is [TextCapitalization.sentences]
  final TextCapitalization textCapitalization;

  const InputField({
    required this.hintText,
    required this.controller,
    this.focusNode,
    this.textCapitalization = TextCapitalization.sentences,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final fontPath = context.themeData.textTheme;
    return TextField(
      style: fontPath.headlineMedium?.copyWith(
        color: colorPath.secondaryTextColor,
        fontWeight: CommonFonts.weightRegular,
      ),
      textCapitalization: textCapitalization,
      controller: controller,
      cursorColor: colorPath.mainAppColor,
      focusNode: focusNode,
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
        hintStyle: fontPath.headlineMedium?.copyWith(
          color: colorPath.secondaryTextColor,
          fontWeight: CommonFonts.weightRegular,
        ),
      ),
    );
  }
}
