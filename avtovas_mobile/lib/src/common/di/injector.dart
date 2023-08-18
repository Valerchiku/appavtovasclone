import 'package:avtovas_mobile/src/common/di/cubit_module.dart';
import 'package:avtovas_mobile/src/common/di/data_sources_module.dart';
import 'package:avtovas_mobile/src/common/di/interactors_module.dart';
import 'package:avtovas_mobile/src/common/di/page_module.dart';
import 'package:avtovas_mobile/src/common/di/repositories_module.dart';
import 'package:common/avtovas_common_utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

GetIt get i => GetIt.instance;

void injectDependencies() {
  const aOptions = AndroidOptions(encryptedSharedPreferences: true);
  const iOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
  );

  final securedStorage = AvtovasPlatform.isAndroid
      ? const FlutterSecureStorage(aOptions: aOptions)
      : const FlutterSecureStorage(iOptions: iOptions);

  initDataSources(securedStorage);
  initRepositories();
  initInteractors();
  initSharedCubits();
  initCubits();
  initPages();
}
