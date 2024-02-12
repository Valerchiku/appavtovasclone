import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

final class Pagination extends StatefulWidget {
  final int availableSources;
  final ValueChanged<int> onPageChanged;

  const Pagination({
    required this.availableSources,
    required this.onPageChanged,
    super.key,
  });

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  var _selectedPagination = 1;

  late final AutoScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = AutoScrollController();
  }

  void _scrollToConcreteNumber(int number) {
    _scrollController.scrollToIndex(
      number,
      preferPosition: AutoScrollPosition.middle,
    );

    setState(() => _selectedPagination = number);
    widget.onPageChanged(number);
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _PaginationNumberContainer(
          pageNumber: '<<',
          selectedNumber: '$_selectedPagination',
          onPageNumberChanged: (number) => _scrollToConcreteNumber(1),
        ),
        const SizedBox(width: AppDimensions.medium),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (var i = 1; i <= widget.availableSources; i++)
                  AutoScrollTag(
                    key: ValueKey<int>(i),
                    index: i,
                    controller: _scrollController,
                    child: _PaginationNumberContainer(
                      key: ValueKey<int>(i),
                      pageNumber: '$i',
                      selectedNumber: _selectedPagination.toString(),
                      onPageNumberChanged: (number) => _scrollToConcreteNumber(
                        number!,
                      ),
                    ),
                  ),
              ].insertBetween(
                const SizedBox(width: AppDimensions.medium),
              ),
            ),
          ),
        ),
        const SizedBox(width: AppDimensions.medium),
        _PaginationNumberContainer(
          pageNumber: '>>',
          selectedNumber: '$_selectedPagination',
          onPageNumberChanged: (number) => _scrollToConcreteNumber(
            widget.availableSources,
          ),
        ),
      ],
    );
  }
}

final class _PaginationNumberContainer extends StatelessWidget {
  final String selectedNumber;
  final String pageNumber;
  final ValueSetter<int?> onPageNumberChanged;

  const _PaginationNumberContainer({
    required this.pageNumber,
    required this.selectedNumber,
    required this.onPageNumberChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimensions.small),
      ),
      onTap: () => onPageNumberChanged(int.tryParse(pageNumber)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(AppDimensions.medium),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.small),
          ),
          color: selectedNumber == pageNumber
              ? context.theme.mainAppColor
              : context.theme.transparent,
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: context.themeData.textTheme.bodyLarge!.copyWith(
              color: selectedNumber == pageNumber
                  ? context.theme.whiteTextColor
                  : Colors.black,
              fontSize: WebFonts.sizeHeadlineMedium,
            ),
            child: Text(pageNumber),
          ),
        ),
      ),
    );
  }
}
