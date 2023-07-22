import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

// ignore_for_file: unused_import
// ignore_for_file: prefer_if_elements_to_conditional_expressions
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: comment_references
// ignore_for_file: always_put_required_named_parameters_first

final class InputField extends StatelessWidget {
  final TextEditingController controller;

  // To disable parameter {fieldTitle} , please , set [false] to {showFieldTitle} parameter.
  final String fieldTitle;

  final String hintText;

  /// By default, the value of {showFieldTitle} is [true]
  final bool showFieldTitle;

  /// By default, the value of {focusNode} is [null]
  final FocusNode? focusNode;

  /// By default, the value of {textCapitalization} is [TextCapitalization.sentences]
  final TextCapitalization textCapitalization;
  const InputField({
    required this.hintText,
    this.fieldTitle = '',
    required this.controller,
    this.showFieldTitle = true,
    this.focusNode,
    this.textCapitalization = TextCapitalization.sentences,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themePath = context.themeData.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !showFieldTitle
            ? Container()
            : Text(
                fieldTitle,
                style: themePath.titleSmall?.copyWith(
                  color: context.theme.secondaryTextColor,
                ),
              ),
        const SizedBox(height: CommonDimensions.small),
        TextField(
          textCapitalization: textCapitalization,
          style: themePath.headlineMedium?.copyWith(
            color: colorPath.secondaryTextColor,
            fontWeight: CommonFonts.weightRegular,
          ),
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
