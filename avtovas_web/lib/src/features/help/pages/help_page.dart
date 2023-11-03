import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/navigation/app_router.dart';
import 'package:avtovas_web/src/common/navigation/configurations.dart';
import 'package:avtovas_web/src/common/widgets/base_page/base_page.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageBuilder(
      layoutBuilder: (smartLayout, mobileLayout) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                smartLayout ? WebDimensions.large : WebDimensions.extraLarge,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.locale.help,
                style: context.themeData.textTheme.displayMedium,
              ),
              const SizedBox(height: WebDimensions.medium),
              PageOptionTile(
                title: context.locale.inquiry,
                onTap: () {
                  AppRouter.appRouter.navigateTo(
                    CustomRoute(
                      RouteType.navigateTo,
                      avtovasContactsConfig(),
                    ),
                  );
                },
              ),
              PageOptionTile(
                title: context.locale.directoryInfo,
                onTap: () {},
              ),
              PageOptionTile(
                title: context.locale.contacts,
                onTap: () {},
              ),
              const SizedBox(height: WebDimensions.extraLarge * 8),
            ],
          ),
        );
      },
    );
  }
}
