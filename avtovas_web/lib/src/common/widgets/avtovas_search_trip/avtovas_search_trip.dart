import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:avtovas_web/src/common/widgets/store_buttons/store_button.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_search_trip.dart';
import 'package:common/avtovas_utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AvtovasSearchTrip extends StatelessWidget {
  final TextEditingController arrivalController;
  final TextEditingController departureController;
  final ValueChanged<String>? onChangedArrival;
  final ValueChanged<String>? onChangedDeparture;
  final VoidCallback search;
  final VoidCallback onSwapTap;
  final VoidCallback onDateTap;
  final List<String> destinationsSuggestions;
  final List<String> suggestions;
  final bool smartLayout;
  final String buttonText;

  const AvtovasSearchTrip({
    required this.arrivalController,
    required this.departureController,
    required this.onChangedArrival,
    required this.search,
    required this.onChangedDeparture,
    required this.onSwapTap,
    required this.onDateTap,
    required this.suggestions,
    required this.destinationsSuggestions,
    required this.smartLayout,
    required this.buttonText,
    super.key,
  });

  Future<void> _launchPlayStore() {
    final uri = Uri.parse(
      'https://play.google.com/store/apps/details?id=com.avtovas.appavtovas.avtovas_mobile',
    );

    return launchUrl(uri);
  }

  Future<void> _launchAppStore() {
    final uri = Uri.parse(
      'https://apps.apple.com/by/app/%D0%B2%D0%BE%D0%BA%D0%B7%D0%B0%D0%BB21/id6476277393',
    );

    return launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final sizeDisplayLargeStyle =
        context.themeData.textTheme.headlineLarge?.copyWith(
      color: context.theme.whiteTextColor,
      fontSize: WebFonts.sizeDisplayLarge,
      fontWeight: WebFonts.weightRegular,
    );
    final sizeHeadlineMediumStyle =
        context.themeData.textTheme.headlineLarge?.copyWith(
      color: context.theme.whiteTextColor,
      fontSize: WebFonts.sizeDisplaySmall,
      fontWeight: WebFonts.weightRegular,
    );

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            WebAssets.busBackground,
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: AppDimensions.medium),
              Text(
                context.locale.mainSearchTitle,
                style: !smartLayout
                    ? sizeDisplayLargeStyle
                    : sizeHeadlineMediumStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.small),
              Container(
                padding: const EdgeInsets.all(
                  AppDimensions.large,
                ),
                width: MediaQuery.sizeOf(context).width / 1.5,
                decoration: BoxDecoration(
                  color: context.theme.whiteTextColor,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.medium,
                  ),
                ),
                child: Center(
                  child: _SearchTrip(
                    arrivalController: arrivalController,
                    departureController: departureController,
                    onArrivalSubmitted: (value) {
                      onChangedArrival?.call(value);
                    },
                    onDepartureSubmitted: (value) {
                      onChangedDeparture?.call(value);
                    },
                    search: search,
                    onSwapTap: onSwapTap,
                    onDateTap: onDateTap,
                    onFindFlightTap: search,
                    destinationsSuggestions: destinationsSuggestions,
                    suggestions: suggestions,
                    smartLayout: smartLayout,
                    buttonText: buttonText,
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.large),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StoreButton(
                    svgPath: WebAssets.appleLogo,
                    storeName: 'AppStore   ',
                    onTap: _launchAppStore,
                  ),
                  const SizedBox(width: CommonDimensions.medium),
                  StoreButton(
                    svgPath: WebAssets.playStoreLogo,
                    storeName: 'Google Play',
                    onTap: _launchPlayStore,
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.large),
            ],
          ),
        ),
      ],
    );
  }
}

class _SearchTrip extends StatefulWidget {
  final TextEditingController arrivalController;
  final TextEditingController departureController;
  final ValueChanged<String> onArrivalSubmitted;
  final ValueChanged<String> onDepartureSubmitted;
  final VoidCallback onSwapTap;
  final VoidCallback search;
  final VoidCallback onDateTap;
  final VoidCallback onFindFlightTap;
  final List<String> destinationsSuggestions;
  final List<String> suggestions;
  final bool smartLayout;
  final String buttonText;

  const _SearchTrip({
    required this.arrivalController,
    required this.departureController,
    required this.onDepartureSubmitted,
    required this.onArrivalSubmitted,
    required this.onSwapTap,
    required this.search,
    required this.onDateTap,
    required this.onFindFlightTap,
    required this.destinationsSuggestions,
    required this.suggestions,
    required this.smartLayout,
    required this.buttonText,
  });

  @override
  State<_SearchTrip> createState() => _SearchTripState();
}

class _SearchTripState extends State<_SearchTrip> {
  late final UniqueKey _departureUniqueKey;
  late final UniqueKey _arrivalUniqueKey;

  @override
  void initState() {
    super.initState();

    _departureUniqueKey = UniqueKey();
    _arrivalUniqueKey = UniqueKey();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.smartLayout) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SearchTripHorizontal(
              departureUniqueKey: _departureUniqueKey,
              arrivalUniqueKey: _arrivalUniqueKey,
              firstItems: widget.destinationsSuggestions,
              secondItems: widget.suggestions,
              arrivalController: widget.arrivalController,
              departureController: widget.departureController,
              onDepartureSubmitted: widget.onDepartureSubmitted,
              onArrivalSubmitted: widget.onArrivalSubmitted,
              onSwapButtonTap: widget.onSwapTap,
              fillColor: context.theme.dividerColor,
            ),
          ),
          const SizedBox(width: AppDimensions.large),
          AvtovasButton.icon(
            buttonColor: context.theme.dividerColor,
            buttonText: widget.buttonText,
            textStyle: context.themeData.textTheme.headlineSmall
                ?.copyWith(fontWeight: WebFonts.weightRegular),
            svgPath: WebAssets.searchCalendarIcon,
            sizeBetween: AppDimensions.medium,
            iconColor: context.theme.mainAppColor,
            onTap: widget.onDateTap,
          ),
          const SizedBox(width: AppDimensions.large),
          AvtovasButton.text(
            buttonText: context.locale.findTrip,
            onTap: widget.onFindFlightTap,
          ),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SearchTripVertical(
          departureUniqueKey: _departureUniqueKey,
          arrivalUniqueKey: _arrivalUniqueKey,
          firstItems: widget.destinationsSuggestions,
          secondItems: widget.suggestions,
          arrivalController: widget.arrivalController,
          departureController: widget.departureController,
          onDepartureSubmitted: widget.onDepartureSubmitted,
          onArrivalSubmitted: widget.onArrivalSubmitted,
          onSwapButtonTap: widget.onSwapTap,
          fillColor: context.theme.dividerColor,
        ),
        const SizedBox(height: AppDimensions.large),
        AvtovasButton.icon(
          buttonColor: context.theme.dividerColor,
          buttonText: widget.buttonText,
          textStyle: context.themeData.textTheme.headlineSmall
              ?.copyWith(fontWeight: WebFonts.weightRegular),
          svgPath: WebAssets.searchCalendarIcon,
          sizeBetween: AppDimensions.medium,
          iconColor: context.theme.mainAppColor,
          onTap: widget.onDateTap,
        ),
        const SizedBox(height: AppDimensions.large),
        AvtovasButton.text(
          buttonText: context.locale.findTrip,
          onTap: widget.onFindFlightTap,
        ),
      ],
    );
  }
}

class _StoreButtons extends StatelessWidget {
  final VoidCallback callback;

  const _StoreButtons({
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: callback,
          child: Image.asset(ImagesAssets.googlePlay),
        ),
        const SizedBox(width: CommonDimensions.medium),
        GestureDetector(
          onTap: callback,
          child: Image.asset(ImagesAssets.appStore),
        ),
      ],
    );
  }
}
