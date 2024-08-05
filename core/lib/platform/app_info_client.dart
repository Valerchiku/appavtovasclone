import 'package:package_info_plus/package_info_plus.dart';

final class AppInfoClient {
  static PackageInfo? _appInstance;

  static String? get appVersion => _appInstance?.version;

  static Future<void> initializeInstance() async {
    _appInstance = await PackageInfo.fromPlatform();
  }
}
