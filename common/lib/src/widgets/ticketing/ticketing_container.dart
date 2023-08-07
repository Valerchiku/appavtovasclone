import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/material.dart';

final class TicketingContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const TicketingContainer({
    required this.child,
    this.backgroundColor,
    this.margin,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor ?? const Color(0xFFF8F8F8),
          borderRadius: const BorderRadius.all(
            Radius.circular(CommonDimensions.large),
          ),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(CommonDimensions.large),
          child: child,
        ),
      ),
    );
  }
}
