import 'package:flutter/material.dart';

final class AnimatedSizedBox extends StatelessWidget {
  final double? toHeight;
  final double? toWidth;
  final Widget? child;

  const AnimatedSizedBox({
    this.toHeight,
    this.toWidth,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      child: SizedBox(
        height: toHeight,
        width: toWidth,
        child: child,
      ),
    );
  }
}
