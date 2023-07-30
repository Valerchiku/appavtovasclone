import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/utils/list_extension.dart';
import 'package:avtovas_mobile/src/features/main_search/widgets/search_history_container.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class MainSearchBody extends StatefulWidget {
  const MainSearchBody({super.key});

  @override
  State<MainSearchBody> createState() => _MainSearchBodyState();
}

class _MainSearchBodyState extends State<MainSearchBody> {
  late final TextEditingController _arrivalController;
  late final TextEditingController _departureController;

  @override
  void initState() {
    super.initState();

    _arrivalController = TextEditingController();
    _departureController = TextEditingController();
  }

  @override
  void dispose() {
    _arrivalController.dispose();
    _departureController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Image.asset(
            AppAssets.mainSearchBackground,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            const SizedBox(height: kToolbarHeight + AppDimensions.large),
            const AvtovasVectorImage(svgAssetPath: AppAssets.mainActovasLogo),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.extraLarge,
              ),
              child: SearchTrip(
                items: [],
                arrivalController: _arrivalController,
                departureController: _departureController,
                onChangedArrival: (value) {},
                onChangedDeparture: (value) {},
                onPressed: () {},
              ),
            ),
            const Spacer(),
            ExpansionContainer(
              title: Text(
                'Ранее искали',
                style: context.themeData.textTheme.titleLarge?.copyWith(
                  color: context.theme.whiteTextColor,
                ),
              ),
              margin: const EdgeInsets.only(
                bottom: AppDimensions.large,
                left: AppDimensions.large,
                right: AppDimensions.large,
              ),
              arrowColor: context.theme.whitespaceContainerColor,
              arrowIndent: AppDimensions.medium,
              titleAlignment: MainAxisAlignment.center,
              childrenAlignment: CrossAxisAlignment.center,
              sizeBetweenElements: AppDimensions.large,
              sizeBetweenChildren: AppDimensions.medium,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SearchHistoryContainer(
                        departurePlace: 'Алатырь',
                        arrivalPlace: 'Новочебоксарск',
                      ),
                      SearchHistoryContainer(
                        departurePlace: 'Алатырь',
                        arrivalPlace: 'Новочебоксарск',
                      ),
                    ].insertBetween(
                      const SizedBox(width: AppDimensions.medium),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AvtovasButton.text(
                      buttonText: 'Очистить историю поиска',
                      buttonColor: context.theme.transparent,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
