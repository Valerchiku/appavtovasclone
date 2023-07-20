import 'package:avtovas_web/src/common/di/cubit_module.dart';
import 'package:get_it/get_it.dart';

GetIt get i => GetIt.instance;

void injectDependencies() {
  initSharedCubits();
  initCubits();
}
