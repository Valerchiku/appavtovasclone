import 'package:avtovas_mobile/src/common/di/cubit_module.dart';
import 'package:avtovas_mobile/src/common/di/data_sources_module.dart';
import 'package:avtovas_mobile/src/common/di/interactors_module.dart';
import 'package:avtovas_mobile/src/common/di/page_module.dart';
import 'package:avtovas_mobile/src/common/di/repositories_module.dart';
import 'package:get_it/get_it.dart';

GetIt get i => GetIt.instance;

void injectDependencies() {
  initDataSources();
  initRepositories();
  initInteractors();
  initSharedCubits();
  initCubits();
  initPages();
}
