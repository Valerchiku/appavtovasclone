import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/widgets/selectable_menu/selectable_menu_item.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class SelectableMenu extends StatefulWidget {
  final String currentValue;
  final String svgAssetPath;
  final Color backgroundColor;
  final List<SelectableMenuItem> menuItems;
  const SelectableMenu({
    required this.currentValue,
    required this.svgAssetPath,
    required this.backgroundColor,
    required this.menuItems,
    super.key,
  });

  @override
  State<SelectableMenu> createState() => _SelectableMenuState();
}

class _SelectableMenuState extends State<SelectableMenu> {
  String currentValue = '1';
  String itemValue = '1';
  String itemValueSecond = '2';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.menuItems,
          ),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimensions.medium,
            ),
          ),
        ),
        child: ListTile(
          title: Text(
            widget.currentValue,
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: AppFonts.weightRegular,
            ),
          ),
          trailing: AvtovasVectorImage(
            svgAssetPath: widget.svgAssetPath,
          ),
        ),
      ),
    );
  }
}
