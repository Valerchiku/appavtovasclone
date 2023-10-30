import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
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
  final VoidCallback onSwapTap;
  final VoidCallback onDateTap;
  final List<String> suggestions;
  final bool smartLayout;

  const AvtovasSearchTrip({
    required this.arrivalController,
    required this.departureController,
    required this.onChangedArrival,
    required this.onChangedDeparture,
    required this.onSwapTap,
    required this.onDateTap,
    required this.suggestions,
    required this.smartLayout,
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
                    onChangedArrival: onChangedArrival,
                    onChangedDeparture: onChangedDeparture,
                    onSwapTap: onSwapTap,
                    onDateTap: onDateTap,
                    suggestions: suggestions,
                    smartLayout: smartLayout,
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
  final ValueChanged<String>? onChangedArrival;
  final ValueChanged<String>? onChangedDeparture;
  final VoidCallback onSwapTap;
  final VoidCallback onDateTap;
  final List<String> suggestions;
  final bool smartLayout;

  const _SearchTrip({
    required this.arrivalController,
    required this.departureController,
    required this.onChangedArrival,
    required this.onChangedDeparture,
    required this.onSwapTap,
    required this.onDateTap,
    required this.suggestions,
    required this.smartLayout,
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
              onChangedArrival: (value) => onChangedArrival,
              onChangedDeparture: (value) => onChangedDeparture,
              onSwapButtonTap: onSwapTap,
              fillColor: context.theme.dividerColor,
            ),
          ),
          const SizedBox(width: AppDimensions.medium),
          AvtovasButton.icon(
            buttonColor: context.theme.dividerColor,
            buttonText: '26.04.2023',
            textStyle: context.themeData.textTheme.headlineSmall
                ?.copyWith(fontWeight: WebFonts.weightRegular),
            svgPath: WebAssets.searchCalendarIcon,
            sizeBetween: AppDimensions.medium,
            iconColor: context.theme.mainAppColor,
            onTap: onDateTap,
          ),
          const SizedBox(width: AppDimensions.medium),
          AvtovasButton.text(
            buttonText: context.locale.search,
            onTap: () => onDateTap,
          ),
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
          onChangedArrival: (value) => onChangedArrival,
          onChangedDeparture: (value) => onChangedDeparture,
          onSwapButtonTap: onSwapTap,
          fillColor: context.theme.dividerColor,
        ),
        const SizedBox(height: AppDimensions.medium),
        Column(
          children: [
            AvtovasButton.icon(
              buttonColor: context.theme.whiteTextColor,
              buttonText: '26.04.2023',
              textStyle: context.themeData.textTheme.headlineSmall
                  ?.copyWith(fontWeight: WebFonts.weightRegular),
              svgPath: WebAssets.searchCalendarIcon,
              sizeBetween: AppDimensions.medium,
              iconColor: context.theme.mainAppColor,
              onTap: () {},
            ),
            const SizedBox(height: AppDimensions.small),
            AvtovasButton.text(
              buttonText: 'Найти билет',
              onTap: () {},
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
