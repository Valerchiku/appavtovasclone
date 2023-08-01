import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/list_extension.dart';
import 'package:flutter/widgets.dart';

class MyTripStatusRow extends StatelessWidget {
  final List<Widget> statusWidgets;
  const MyTripStatusRow({
    required this.statusWidgets,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: statusWidgets.insertBetween(
        const SizedBox(
          width: CommonDimensions.small,
        ),
      ),
    );
  }
}
