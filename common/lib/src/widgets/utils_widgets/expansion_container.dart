import 'dart:math' as math;

import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/list_extension.dart';
import 'package:flutter/material.dart';

class ExpansionContainer extends StatefulWidget {
  final Widget title;
  final List<Widget> children;
  final ValueChanged<bool>? onStatusChanged;
  final bool showArrow;
  final ArrowAlignment arrowAlignment;
  final double? sizeBetweenChildren;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final EdgeInsets? titlePadding;
  final Border? border;
  final BorderRadius? borderRadius;

  const ExpansionContainer({
    required this.title,
    required this.children,
    this.onStatusChanged,
    this.showArrow = true,
    this.arrowAlignment = ArrowAlignment.start,
    this.sizeBetweenChildren,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.titlePadding,
    this.border,
    this.borderRadius,
    super.key,
  });

  @override
  _ExpansionContainerState createState() => _ExpansionContainerState();
}

class _ExpansionContainerState extends State<ExpansionContainer>
    with TickerProviderStateMixin {
  late final AnimationController _expansionController;
  late final Animation<double> _expansionAnimation;
  late final AnimationController? _rotationController;
  late final Animation<double>? _rotationAnimation;

  var _isExpanded = false;

  @override
  void initState() {
    super.initState();

    _expansionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _expansionAnimation = CurvedAnimation(
      parent: _expansionController,
      curve: Curves.fastOutSlowIn,
    );

    if (widget.showArrow) {
      _rotationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
      );

      const beginRotation = 0.0;
      const endRotation = 0.5;

      _rotationAnimation = Tween(
        begin: beginRotation,
        end: endRotation,
      ).animate(
        CurvedAnimation(
          parent: _rotationController!,
          curve: Curves.fastOutSlowIn,
        ),
      );
    }
  }

  void _onContainerTap() {
    setState(() => _isExpanded = !_isExpanded);

    if (_isExpanded) {
      _expansionController.forward();
      _rotationController?.forward();
    } else {
      _expansionController.reverse();
      _rotationController?.reverse();
    }

    widget.onStatusChanged?.call(_isExpanded);
  }

  @override
  void dispose() {
    _expansionController.dispose();
    _rotationController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const rotationCount = 2;

    return InkWell(
      onTap: _onContainerTap,
      borderRadius: widget.borderRadius,
      child: Container(
        margin: widget.margin ?? EdgeInsets.zero,
        padding: widget.padding ??
            const EdgeInsets.all(
              CommonDimensions.medium,
            ),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: widget.border,
          borderRadius: widget.borderRadius,
        ),
        child: Column(
          children: [
            Padding(
              padding: widget.titlePadding ?? EdgeInsets.zero,
              child: Row(
                children: [
                  widget.title,
                  if (widget.arrowAlignment == ArrowAlignment.start)
                    const SizedBox(width: CommonDimensions.large)
                  else
                    const Spacer(),
                  if (widget.showArrow)
                    AnimatedBuilder(
                      animation: _rotationAnimation!,
                      builder: (_, child) {
                        return Transform.rotate(
                          angle: _rotationAnimation!.value *
                              rotationCount *
                              math.pi,
                          child: const Icon(Icons.keyboard_arrow_down_outlined),
                        );
                      },
                    ),
                ],
              ),
            ),
            SizeTransition(
              sizeFactor: _expansionAnimation,
              child: Column(
                children: [
                  if (widget.sizeBetweenChildren != null)
                    ...widget.children.insertBetween(
                      SizedBox(
                        height: widget.sizeBetweenChildren,
                      ),
                    )
                  else
                    ...widget.children,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ArrowAlignment { start, end }
