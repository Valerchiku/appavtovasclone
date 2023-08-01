import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class DetailsContainer extends StatelessWidget {
  final List<Widget> children;

  const DetailsContainer({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CommonDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.whitespaceContainerColor,
        border: Border.all(
          color: context.theme.dividerColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(CommonDimensions.large),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
