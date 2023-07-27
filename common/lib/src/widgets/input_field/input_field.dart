import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: comment_references

final class InputField extends StatelessWidget {
  final GlobalKey<FormState>? formKey;

  final String? hintText;

  // By default , value of {onChanged} is [null]
  final ValueChanged? onChanged;

  // By default , value of {controller} is [null]
  final TextEditingController? controller;

  // By default, value of {fieldTitle} is [null]
  final String? fieldTitle;

  /// By default, the value of {focusNode} is [null]
  final FocusNode? focusNode;

  /// By default, the value of {textCapitalization} is [TextCapitalization.sentences]
  final TextCapitalization textCapitalization;

  /// By default, the value of {minLines} is [1]
  final int minLines;

  /// By default, the value of {maxLines} is [2]
  final int maxLines;

  final InputDecoration? decoration;

  final String? Function(String? value)? validator;

  final TextInputType? keyboardType;

  const InputField({
    this.hintText,
    this.formKey,
    this.onChanged,
    this.controller,
    this.fieldTitle,
    this.focusNode,
    this.textCapitalization = TextCapitalization.sentences,
    this.minLines = CommonDimensions.defaultMinLines,
    this.maxLines = CommonDimensions.defaultMaxLines,
    this.decoration,
    this.validator,
    this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themePath = context.themeData.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fieldTitle != null)
          Padding(
            padding: const EdgeInsets.only(bottom: CommonDimensions.extraSmall),
            child: Text(
              fieldTitle!,
              style: themePath.titleSmall?.copyWith(
                color: context.theme.secondaryTextColor,
              ),
            ),
          ),
        Form(
          key: formKey,
          child: TextFormField(
            keyboardType: keyboardType,
            validator: validator,
            minLines: minLines,
            maxLines: maxLines,
            textCapitalization: textCapitalization,
            style: themePath.headlineMedium?.copyWith(
              color: colorPath.secondaryTextColor,
              fontWeight: CommonFonts.weightRegular,
            ),
            controller: controller,
            cursorColor: colorPath.mainAppColor,
            focusNode: focusNode,
            decoration: decoration ?? InputDecoration(
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
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
