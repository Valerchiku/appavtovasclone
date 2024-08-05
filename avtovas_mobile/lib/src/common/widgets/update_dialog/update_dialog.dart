import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

final class UpdateDialog extends StatelessWidget {
  const UpdateDialog({super.key});

  Future<void> _redirectToStore(String url) async {
    if (await launcher.canLaunchUrl(Uri.parse(url))) {
      launcher.launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    final mobileUrl = AvtovasPlatform.isIOS
        ? 'https://apps.apple.com/by/app/%D0%B2%D0%BE%D0%BA%D0%B7%D0%B0%D0%BB21/id6476277393'
        : 'https://play.google.com/store/apps/details?id=com.avtovas.appavtovas.avtovas_mobile&hl=en_US&pli=1';
    const ruStoreUrl =
        'https://apps.rustore.ru/app/com.avtovas.appavtovas.avtovas_mobile';

    return PopScope(
      canPop: false,
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: DecoratedBox(
          decoration: BoxDecoration(
            color: context.theme.whiteTextColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppDimensions.large),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.large),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Доступна новая версия',
                  style: context.themeData.textTheme.bodyLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppDimensions.medium),
                Text(
                  'Загрузите последнее обновление, чтобы продолжить использование',
                  style: context.themeData.textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: AppDimensions.large),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _redirectToStore(mobileUrl),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: context.theme.mainAppColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppDimensions.mediumLarge),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (AvtovasPlatform.isAndroid) ...[
                              const AvtovasVectorImage(
                                svgAssetPath: AppAssets.googlePlayIcon,
                                width: 24,
                                height: 24,
                                colorFilter: ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: AppDimensions.medium),
                              Text(
                                'Play Market',
                                style: context.themeData.textTheme.bodyLarge
                                    ?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                            if (AvtovasPlatform.isIOS) ...[
                              Icon(
                                Icons.apple,
                                color: context.theme.whiteTextColor,
                              ),
                              const SizedBox(width: AppDimensions.medium),
                              Text(
                                'Загрузить из AppStore',
                                style: context.themeData.textTheme.bodyLarge
                                    ?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    if (AvtovasPlatform.isAndroid) ...[
                      const SizedBox(width: AppDimensions.medium),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _redirectToStore(ruStoreUrl),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: context.theme.mainAppColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(AppDimensions.mediumLarge),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const AvtovasVectorImage(
                                svgAssetPath: AppAssets.ruStoreIcon,
                                width: 24,
                                height: 24,
                                colorFilter: ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: AppDimensions.medium),
                              Text(
                                'RuStore',
                                style: context.themeData.textTheme.bodyLarge
                                    ?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
