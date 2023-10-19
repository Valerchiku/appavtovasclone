import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
// import 'package:avtovas_web/src/common/utils/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class TripsScheduleBody extends StatelessWidget {
  const TripsScheduleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final isNonSmart = maxWidth > WebDimensions.maxNonSmartWidth;
        final isSmart = maxWidth <= WebDimensions.maxNonSmartWidth;
        return ListView(
          padding: EdgeInsets.symmetric(
            horizontal: isNonSmart
                ? WebDimensions.rootPaddingLeft
                : WebDimensions.large,
          ),
          children: [
            Text(
              'Главная / Расписание маршрутов ',
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                color: context.theme.assistiveTextColor,
                fontWeight: WebFonts.weightRegular,
              ),
            ),
            const SizedBox(height: WebDimensions.large),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(WebDimensions.medium),
                  decoration: BoxDecoration(
                    color: context.theme.whiteTextColor,
                    borderRadius: BorderRadius.circular(
                      WebDimensions.medium,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text('Сортировка по времени'),
                      SizedBox(width: WebDimensions.small),
                      AvtovasVectorImage(
                        svgAssetPath: WebAssets.dropDownArrowIcon,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: WebDimensions.large),
            Row(
              children: [
                const AvtovasVectorImage(
                  svgAssetPath: WebAssets.leftArrowIcon,
                ),
                const SizedBox(width: WebDimensions.medium),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Расписание маршрутов на ',
                          style: isNonSmart
                              ? context.themeData.textTheme.displayMedium
                              : context.themeData.textTheme.headlineMedium,
                        ),
                        TextSpan(
                          text: '6 июля',
                          style: isNonSmart
                              ? context.themeData.textTheme.displayMedium
                                  ?.copyWith(
                                  color: context.theme.mainAppColor,
                                )
                              : context.themeData.textTheme.headlineMedium
                                  ?.copyWith(
                                  color: context.theme.mainAppColor,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: WebDimensions.large),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) => TripContainer(
                onTap: () {},
                ticketPrice: context.locale.price('200'),
                freePlaces: '10',
                tripNumber: '100',
                tripRoot: 'Саранск АВ — Новочебоксарск г. ДКП 2190',
                departurePlace: 'Алатырь',
                arrivalPlace: 'Новочебоксарск',
                timeInRoad: '12ч 30',
                departureDateTime: '2023-10-25T06:20:00',
                arrivalDateTime: '2023-10-25T06:20:00',
              ),
            ),
          ],
        );
      },
    );
  }
}
