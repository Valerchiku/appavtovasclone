import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/widgets/selectable_menu/selectable_menu_item.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

// ignore_for_file: unnecessary_lambdas

class SelectableMenu extends StatefulWidget {
  final String currentLabel;
  final String svgAssetPath;
  final Color backgroundColor;
  final List<SelectableMenuItem> menuItems;
  const SelectableMenu({
    required this.currentLabel,
    required this.svgAssetPath,
    required this.backgroundColor,
    required this.menuItems,
    super.key,
  });

  @override
  State<SelectableMenu> createState() => _SelectableMenuState();
}

class _SelectableMenuState extends State<SelectableMenu> {
  Future<void> 
  _showDialog() async{
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.menuItems,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDialog(),
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
            widget.currentLabel,
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
