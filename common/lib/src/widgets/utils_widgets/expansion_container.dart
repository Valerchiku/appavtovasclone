import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:common/src/utils/list_extension.dart';
import 'package:flutter/material.dart';

class ExpansionContainer extends StatefulWidget {
  final Widget title;
  final List<Widget> children;
  final ValueChanged<bool>? onStatusChanged;
  final double? sizeBetweenChildren;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Border? border;
  final BorderRadius? borderRadius;
  final bool showIcon;
  final CrossAxisAlignment titleCrossAxisAlignment;
  final CrossAxisAlignment contentCrossAxisAlignment;

  const ExpansionContainer({
    required this.title,
    required this.children,
    this.onStatusChanged,
    this.sizeBetweenChildren,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.border,
    this.borderRadius,
    this.showIcon = false,
    this.titleCrossAxisAlignment = CrossAxisAlignment.center,
    this.contentCrossAxisAlignment = CrossAxisAlignment.center,
    super.key,
  });

  @override
  _ExpansionContainerState createState() => _ExpansionContainerState();
}

class _ExpansionContainerState extends State<ExpansionContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _onContainerTap() {
    setState(() => _isExpanded = !_isExpanded);
    _isExpanded
        ? _animationController.forward()
        : _animationController.reverse();
    widget.onStatusChanged?.call(_isExpanded);
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onContainerTap,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(CommonDimensions.large),
        bottomRight: Radius.circular(CommonDimensions.large),
      ),
      child: Container(
        margin: widget.margin,
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: widget.border,
          borderRadius: widget.borderRadius,
        ),
        child: Column(
          crossAxisAlignment: widget.titleCrossAxisAlignment,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.title,
                if (widget.showIcon)
                  AvtovasVectorImage(
                    svgAssetPath: !_isExpanded
                        ? ImagesAssets.downArrowIcon
                        : ImagesAssets.upArrowIcon,
                  ),
              ],
            ),
            SizeTransition(
              sizeFactor: _animation,
              child: Column(
                crossAxisAlignment: widget.contentCrossAxisAlignment,
                children: [
                  const SizedBox(
                    height: CommonDimensions.large,
                  ),
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
