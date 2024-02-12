import 'dart:async';

import 'package:common/src/theme/theme_extension.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

class EasyAutocomplete extends StatefulWidget {
  /// The list of suggestions to be displayed
  final List<String>? suggestions;

  /// Fetches list of suggestions from a Future
  final Future<List<String>> Function(String searchValue)? asyncSuggestions;

  /// Text editing controller
  final TextEditingController? controller;

  /// Function that handles the changes to the input
  final Function(String)? onChanged;

  /// Function that handles the submission of the input
  final Function(String)? onSubmitted;

  /// Can be used to set custom inputFormatters to field
  final List<TextInputFormatter> inputFormatter;

  /// Can be used to set the textfield initial value
  final String? initialValue;

  /// Can be used to set the text capitalization type
  final TextCapitalization textCapitalization;

  /// Determines if should gain focus on screen open
  final bool autofocus;

  /// Can be used to set different keyboardTypes to your field
  final TextInputType keyboardType;

  /// Can be used to manage TextField focus
  final FocusNode? focusNode;

  /// Can be used to set a custom color to the input cursor
  final Color? cursorColor;

  /// Can be used to set custom style to the suggestions textfield
  final TextStyle? inputTextStyle;

  /// Can be used to set custom style to the suggestions list text
  final TextStyle suggestionTextStyle;

  /// Can be used to set custom background color to suggestions list
  final Color? suggestionBackgroundColor;

  /// Used to set the debounce time for async data fetch
  final Duration debounceDuration;

  /// Can be used to customize suggestion items
  final Widget Function(
    String suggestion,
    int index,
    VoidCallback rebuildCallback,
  )? suggestionBuilder;

  /// Can be used to display custom progress idnicator
  final Widget? progressIndicatorBuilder;

  final Widget? prefix;

  final String? hintText;

  /// Can be used to validate field value
  final String? Function(String?)? validator;

  final ValueChanged<bool>? onOverlayOpened;

  final VoidCallback? onFieldClearButtonTap;

  final VoidCallback? onFieldTap;

  final VoidCallback? onSuggestionsClose;

  final bool shouldCloseOverlay;

  /// Creates a autocomplete widget to help you manage your suggestions
  const EasyAutocomplete({
    this.suggestions,
    this.asyncSuggestions,
    this.suggestionBuilder,
    this.progressIndicatorBuilder,
    this.onOverlayOpened,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.hintText,
    this.inputFormatter = const [],
    this.initialValue,
    this.autofocus = false,
    this.prefix,
    this.textCapitalization = TextCapitalization.sentences,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.cursorColor,
    this.onSuggestionsClose,
    this.inputTextStyle,
    this.suggestionTextStyle = const TextStyle(),
    this.suggestionBackgroundColor,
    this.onFieldClearButtonTap,
    this.debounceDuration = const Duration(milliseconds: 400),
    this.validator,
    this.onFieldTap,
    this.shouldCloseOverlay = false,
    super.key,
  })  : assert(
          onChanged != null || controller != null,
          'onChanged and controller parameters cannot be both null at the same '
          'time',
        ),
        assert(
          !(controller != null && initialValue != null),
          'controller and initialValue cannot be used at the same time',
        ),
        assert(
          suggestions != null && asyncSuggestions == null ||
              suggestions == null && asyncSuggestions != null,
          'suggestions and asyncSuggestions cannot be both null or have values '
          'at the same time',
        );

  @override
  State<EasyAutocomplete> createState() => _EasyAutocompleteState();
}

class _EasyAutocompleteState extends State<EasyAutocomplete>
    with WidgetsBindingObserver {
  final LayerLink _layerLink = LayerLink();
  late final TextEditingController _controller;
  var _hasOpenedOverlay = false;
  var _isLoading = false;
  OverlayEntry? _overlayEntry;
  List<String> _suggestions = [];
  Timer? _debounce;
  String _previousAsyncSearchText = '';
  late final FocusNode _focusNode;

  late final Size _lastScreenSize;

  late final GlobalKey _fieldKey;

  late final BehaviorSubject<(bool, bool)> _overlayStatusesSubject;

  var _shouldShowClearSuffix = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    _focusNode = (widget.focusNode ?? FocusNode())..unfocus();
    _controller = widget.controller ??
        TextEditingController(text: widget.initialValue ?? '');
    _controller.addListener(() => updateSuggestions(_controller.text));

    _fieldKey = GlobalKey();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) _closeOverlay();
    });

    _overlayStatusesSubject = BehaviorSubject.seeded(
      (_hasOpenedOverlay, widget.shouldCloseOverlay),
    );

    Future.delayed(
      Duration.zero,
      () => _lastScreenSize = View.of(context).physicalSize,
    );
  }

  void _initOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;

    if (_overlayEntry == null) {
      final renderBox =
          _fieldKey.currentContext?.findRenderObject() as RenderBox?;

      if (renderBox == null) return;

      final fieldSize = renderBox.size;
      final fieldBottomOffset = renderBox.localToGlobal(
        Offset(0, fieldSize.height),
      );

      _overlayEntry ??= OverlayEntry(
        builder: (context) => Positioned(
          left: fieldBottomOffset.dx,
          top: fieldBottomOffset.dy + 10,
          width: fieldSize.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: const Offset(0, 60),
            child: Theme(
              data: context.themeData.copyWith(
                scrollbarTheme: ScrollbarThemeData(
                  thumbVisibility: MaterialStateProperty.all(true),
                  thumbColor: MaterialStateProperty.all(
                    context.theme.mainAppColor,
                  ),
                ),
              ),
              child: FilterableList(
                initOverlay: () {},
                disposeOverlay: () {},
                overlayStatusStream: _overlayStatusesSubject,
                loading: _isLoading,
                suggestionBuilder: widget.suggestionBuilder,
                rebuildCallback: () => updateSuggestions(_controller.text),
                progressIndicatorBuilder: widget.progressIndicatorBuilder,
                items: _suggestions,
                suggestionTextStyle: widget.suggestionTextStyle,
                suggestionBackgroundColor: widget.suggestionBackgroundColor,
                onItemTapped: (value) {
                  setState(() => _shouldShowClearSuffix = true);
                  _controller.value = TextEditingValue(
                    text: value,
                    selection: TextSelection.collapsed(offset: value.length),
                  );
                  widget.onChanged?.call(value);
                  widget.onSubmitted?.call(value);
                  _closeOverlay();
                  _focusNode.unfocus();
                },
              ),
            ),
          ),
        ),
      );
    }

    Overlay.of(context).insert(_overlayEntry!);
  }

  Future<void> _openOverlay() async {
    if (_isDisposed) return;

    _initOverlay();

    setState(() => _hasOpenedOverlay = true);

    _overlayStatusesSubject.add((_hasOpenedOverlay, widget.shouldCloseOverlay));
  }

  Future<void> _closeOverlay() async {
    widget.onSuggestionsClose?.call();

    setState(
      () {
        _previousAsyncSearchText = '';
        _hasOpenedOverlay = false;
      },
    );

    _overlayStatusesSubject.add((_hasOpenedOverlay, widget.shouldCloseOverlay));
  }

  Future<void> updateSuggestions(String input) async {
    if (_isDisposed) return;

    _rebuildOverlay();
    if (widget.suggestions != null) {
      _suggestions = widget.suggestions!.where((element) {
        return element.toLowerCase().contains(input.toLowerCase());
      }).toList();
      _rebuildOverlay();
    } else if (widget.asyncSuggestions != null) {
      setState(() => _isLoading = true);
      if (_debounce != null && _debounce!.isActive) _debounce!.cancel();
      _debounce = Timer(widget.debounceDuration, () async {
        if (_previousAsyncSearchText != input ||
            _previousAsyncSearchText.isEmpty ||
            input.isEmpty) {
          _suggestions = await widget.asyncSuggestions!(input);
          setState(() {
            _isLoading = false;
            _previousAsyncSearchText = input;
          });
          _rebuildOverlay();
        }
      });
    }
  }

  void _rebuildOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.markNeedsBuild();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        key: _fieldKey,
        height: 50,
        width: MediaQuery.sizeOf(context).width,
        child: CupertinoTextField(
          padding: const EdgeInsets.symmetric(
            horizontal: CommonDimensions.large,
          ),
          prefix: widget.prefix,
          placeholder: widget.hintText,
          placeholderStyle: context.themeData.textTheme.bodyLarge!.copyWith(
            color: context.theme.fivefoldTextColor,
            fontWeight: FontWeight.normal,
            fontSize: CommonFonts.sizeHeadlineMedium,
          ),
          textAlignVertical: TextAlignVertical.center,
          decoration: BoxDecoration(
            color: context.theme.dividerColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          controller: _controller,
          inputFormatters: widget.inputFormatter,
          onTap: () {
            widget.onChanged?.call('');
            _controller.clear();

            if (!_hasOpenedOverlay) _openOverlay();

            widget.onFieldTap?.call();
          },
          autofocus: widget.autofocus,
          focusNode: _focusNode,
          textCapitalization: widget.textCapitalization,
          keyboardType: widget.keyboardType,
          cursorColor: widget.cursorColor,
          style: widget.inputTextStyle ??
              context.themeData.textTheme.bodyLarge!.copyWith(
                color: context.theme.defaultIconColor,
                fontWeight: FontWeight.normal,
              ),
          onChanged: (value) {
            setState(() => _shouldShowClearSuffix = value.isNotEmpty);
            widget.onChanged?.call(value);
          },
          onSubmitted: (value) {
            widget.onSubmitted?.call(value);
            _closeOverlay();
            _focusNode.unfocus();
          },
          onEditingComplete: _closeOverlay,
        ),
      ),
    );
  }

  Future<void> _resizeOverlay() async {
    if (_isDisposed) return;

    final currentScreenSize = View.of(context).physicalSize;

    if (_lastScreenSize.width == currentScreenSize.width) return;

    if (_hasOpenedOverlay) {
      _closeOverlay();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    _resizeOverlay();
  }

  var _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;

    WidgetsBinding.instance.removeObserver(this);

    _overlayStatusesSubject.close();

    _overlayEntry?.remove();

    _overlayEntry?.dispose();

    _overlayEntry = null;
    if (widget.controller == null) {
      _controller
        ..removeListener(() => updateSuggestions(_controller.text))
        ..dispose();
    }
    _debounce?.cancel();
    _focusNode.dispose();

    super.dispose();
  }
}

class FilterableList extends StatefulWidget {
  final VoidCallback initOverlay;
  final VoidCallback disposeOverlay;

  final List<String> items;
  final ValueChanged<String> onItemTapped;
  final double elevation;
  final double maxListHeight;
  final TextStyle suggestionTextStyle;
  final Color? suggestionBackgroundColor;
  final bool loading;
  final VoidCallback rebuildCallback;
  final Widget Function(
    String suggestion,
    int index,
    VoidCallback rebuildCallback,
  )? suggestionBuilder;
  final Widget? progressIndicatorBuilder;
  final Stream<(bool, bool)> overlayStatusStream;

  const FilterableList({
    required this.disposeOverlay,
    required this.initOverlay,
    required this.items,
    required this.onItemTapped,
    required this.overlayStatusStream,
    required this.rebuildCallback,
    this.suggestionBuilder,
    this.elevation = 5,
    this.maxListHeight = 250,
    this.suggestionTextStyle = const TextStyle(),
    this.suggestionBackgroundColor,
    this.loading = false,
    this.progressIndicatorBuilder,
    super.key,
  });

  @override
  State<FilterableList> createState() => _FilterableListState();
}

class _FilterableListState extends State<FilterableList>
    with SingleTickerProviderStateMixin {
  late final AnimationController _suggestionsController;
  late final Animation<double> _suggestionsAnimation;

  /// Subscription to overlay statuses.
  ///
  /// Note:
  /// It is necessary to preserve the order of statuses.
  /// Where
  /// [$1] is the main status (closed/open - mandatory),
  /// [$2] is an auxiliary status (may be absent - false by default).
  late final StreamSubscription<(bool, bool)> _overlayStatusSubscription;

  @override
  void initState() {
    super.initState();

    _suggestionsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _suggestionsAnimation = CurvedAnimation(
      parent: _suggestionsController,
      curve: Curves.decelerate,
    );

    _overlayStatusSubscription = widget.overlayStatusStream.listen((statuses) {
      if (statuses.$1 && !statuses.$2) {
        _suggestionsController.forward();
      } else {
        _suggestionsController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _suggestionsController.dispose();

    _overlayStatusSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _suggestionsAnimation,
      child: Material(
        borderRadius: const BorderRadius.all(
          Radius.circular(CommonDimensions.mediumLarge),
        ),
        color: widget.suggestionBackgroundColor,
        child: Container(
          constraints: BoxConstraints(maxHeight: widget.maxListHeight),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(CommonDimensions.mediumLarge),
            ),
            border: widget.items.isNotEmpty || widget.loading
                ? Border.fromBorderSide(
                    BorderSide(color: context.theme.dividerColor),
                  )
                : null,
          ),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            child: SizedBox(
              height: widget.items.isNotEmpty || widget.loading ? null : 0,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: widget.loading ? 1 : widget.items.length,
                itemBuilder: (context, index) {
                  if (widget.loading) {
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: Visibility(
                        visible: widget.progressIndicatorBuilder != null,
                        replacement: const CircularProgressIndicator(),
                        child: widget.progressIndicatorBuilder!,
                      ),
                    );
                  }

                  if (widget.suggestionBuilder != null) {
                    return InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(CommonDimensions.mediumLarge),
                      ),
                      child: widget.suggestionBuilder!(
                        widget.items[index],
                        index,
                        widget.rebuildCallback,
                      ),
                      onTap: () => widget.onItemTapped(
                        widget.items[index],
                      ),
                    );
                  }

                  return Material(
                    color: context.theme.whiteTextColor,
                    child: InkWell(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          widget.items[index],
                          style: widget.suggestionTextStyle,
                        ),
                      ),
                      onTap: () => widget.onItemTapped(
                        widget.items[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ClearButton extends StatelessWidget {
  final VoidCallback onTap;

  const ClearButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: CommonDimensions.mediumLarge),
      child: Material(
        color: context.theme.dividerColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(CommonDimensions.extraLarge),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(
            Radius.circular(CommonDimensions.extraLarge),
          ),
          child: const Icon(Icons.close),
        ),
      ),
    );
  }
}
