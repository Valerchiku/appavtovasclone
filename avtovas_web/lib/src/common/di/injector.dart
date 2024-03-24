import 'package:avtovas_web/src/common/di/connectivity_module.dart';
import 'package:avtovas_web/src/common/di/cubit_module.dart';
import 'package:avtovas_web/src/common/di/data_sources_module.dart';
import 'package:avtovas_web/src/common/di/interactors_module.dart';
import 'package:avtovas_web/src/common/di/page_module.dart';
import 'package:avtovas_web/src/common/di/repositories_module.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

GetIt get i => GetIt.instance;

void injectDependencies() {
  const webOptions = WebOptions.defaultOptions;
  const aOptions = AndroidOptions(encryptedSharedPreferences: true);
  const iOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
  );
  

  final securedStorage = AvtovasPlatform.isAndroid
      ? const FlutterSecureStorage(aOptions: aOptions)
      : const FlutterSecureStorage(iOptions: iOptions);

  final flutterSecureStorage = AvtovasPlatform.isWeb
      ? const FlutterSecureStorage(
          // ignore: avoid_redundant_argument_values
          webOptions: webOptions,
        )
      : securedStorage;

  initConnectivity();
  initDataSources(flutterSecureStorage);
  initRepositories();
  initInteractors();
  initSharedCubits();
  initCubits();
  initPages();
}
