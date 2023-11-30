import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
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
    required this.smartLayout,
    required this.buttonText,
    super.key,
  });

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

    final url = Uri.parse('https://www.youtube.com/');

    Future<void> launchYoutube() async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

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
                      search();
                    },
                    onDepartureSubmitted: (value) {
                      onChangedDeparture?.call(value);
                      search();
                    },
                    search: search,
                    onSwapTap: onSwapTap,
                    onDateTap: onDateTap,
                    suggestions: suggestions,
                    smartLayout: smartLayout,
                    buttonText: buttonText,
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.large),
              _StoreButtons(callback: launchYoutube),
              const SizedBox(height: AppDimensions.large),
            ],
          ),
        ),
      ],
    );
  }
}

class _SearchTrip extends StatelessWidget {
  final TextEditingController arrivalController;
  final TextEditingController departureController;
  final ValueChanged<String> onArrivalSubmitted;
  final ValueChanged<String> onDepartureSubmitted;
  final VoidCallback onSwapTap;
  final VoidCallback search;
  final VoidCallback onDateTap;
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
    required this.suggestions,
    required this.smartLayout,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    if (!smartLayout) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SearchTripHorizontal(
              items: suggestions,
              arrivalController: arrivalController,
              departureController: departureController,
              onDepartureSubmitted: onDepartureSubmitted,
              onArrivalSubmitted: onArrivalSubmitted,
              onSwapButtonTap: onSwapTap,
              fillColor: context.theme.dividerColor,
            ),
          ),
          const SizedBox(width: AppDimensions.medium),
          AvtovasButton.icon(
            buttonColor: context.theme.dividerColor,
            buttonText: buttonText,
            textStyle: context.themeData.textTheme.headlineSmall
                ?.copyWith(fontWeight: WebFonts.weightRegular),
            svgPath: WebAssets.searchCalendarIcon,
            sizeBetween: AppDimensions.medium,
            iconColor: context.theme.mainAppColor,
            onTap: onDateTap,
          ),
          const SizedBox(width: AppDimensions.medium),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SearchTripVertical(
          items: suggestions,
          arrivalController: arrivalController,
          departureController: departureController,
          onDepartureSubmitted: onDepartureSubmitted,
          onArrivalSubmitted: onArrivalSubmitted,
          onSwapButtonTap: onSwapTap,
          fillColor: context.theme.dividerColor,
        ),
        const SizedBox(height: AppDimensions.medium),
        Column(
          children: [
            AvtovasButton.icon(
              buttonColor: context.theme.dividerColor,
              buttonText: buttonText,
              textStyle: context.themeData.textTheme.headlineSmall
                  ?.copyWith(fontWeight: WebFonts.weightRegular),
              svgPath: WebAssets.searchCalendarIcon,
              sizeBetween: AppDimensions.medium,
              iconColor: context.theme.mainAppColor,
              onTap: onDateTap,
            ),
          ],
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
