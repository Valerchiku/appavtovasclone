import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:avtovas_web/src/features/main/pages/main_page.dart';

void initPages() {
  i.registerFactory<MainSearchPage>(MainSearchPage.new);
}
