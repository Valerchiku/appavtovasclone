import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

// ignore_for_file: unused_import
// ignore_for_file: prefer_if_elements_to_conditional_expressions
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: comment_references

final class InputField extends StatelessWidget {
  final TextEditingController controller;

  // To disable parameter {fieldTitle} , please , set [false] to {showFieldTitle} parameter.
  final String fieldTitle;

  final String hintText;

  /// By default, the value of {showFieldTitle} is [true]
  final bool showFieldTitle;

  /// By default, the value of {focusNode} is [null]
  final FocusNode? focusNode;
  const InputField({
    required this.hintText,
    required this.fieldTitle,
    required this.controller,
    this.showFieldTitle = true,
    this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themePath = context.themeData.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showFieldTitle
            ? Text(
                fieldTitle,
                style: themePath.titleSmall?.copyWith(
                  color: context.theme.secondaryTextColor,
                ),
              )
            : Container(),
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
