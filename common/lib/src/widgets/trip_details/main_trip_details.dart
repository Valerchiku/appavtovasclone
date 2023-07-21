import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/mock_trip.dart';
import 'package:common/src/widgets/trip_details/details_container.dart';
import 'package:common/src/widgets/utils_widgets/expansion_container.dart';
import 'package:flutter/material.dart';

final class MainTripDetails extends StatelessWidget {
  final MockTrip? trip;

  const MainTripDetails({
    this.trip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DetailsContainer(
        children: [
          Text(
            'Отправление и прибытие по местному времени',
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: CommonDimensions.large),
          const TripLine.vertical(
            maxSize: 120,
            firstPointTitle: '19:45, 26 июня',
            secondPointTitle: '20:28, 26 июня',
            firstPointSubtitle: 'Алатырь',
            firstPointDescription:
                'Автовокзал "Щелковский", метро Щелковская; щоссе Щелковское; дом 75',
            secondPointSubtitle: 'Ардатов',
            secondPointDescription:
                'Автовокзал "Пригородный", улица Привокзальная; дом 3',
          ),
          const SizedBox(height: CommonDimensions.large),
          Text(
            'В пути: 12ч 30 мин.',
            style: context.themeData.textTheme.titleLarge?.copyWith(
              color: context.theme.fivefoldTextColor,
            ),
          ),
          const SizedBox(height: CommonDimensions.large),
          ExpansionContainer(
            sizeBetweenChildren: CommonDimensions.large,
            title: Row(
              children: [
                Text(
                  'Промежуточные пункты',
                  style: context.themeData.textTheme.titleLarge?.copyWith(
                    color: context.theme.primaryTextColor,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: context.theme.mainAppColor,
                ),
              ],
            ),
            children: const [
              Text(
                '12:00 Новороссийское шоссе, 1Б',
              ),
              Text(
                '12:00 Новороссийское шоссе, 1Б',
              ),
              Text(
                '12:00 Новороссийское шоссе, 1Б',
              ),
              Text(
                '12:00 Новороссийское шоссе, 1Б',
              ),
              Text(
                '12:00 Новороссийское шоссе, 1Б',
              ),
              Text(
                '12:00 Новороссийское шоссе, 1Б',
              ),
              Text(
                '12:00 Новороссийское шоссе, 1Б',
              ),
            ],
          ),
          const SizedBox(height: CommonDimensions.medium),
        ],
      ),
    );
  }
}
