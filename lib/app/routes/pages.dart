import 'package:get/get.dart';
import 'package:tutorial_inicial/app/modules/category_list/category_list.dart';
import 'package:tutorial_inicial/app/modules/category_list/category_list_controller.dart';
import 'package:tutorial_inicial/app/pages/info/info.dart';
import 'package:tutorial_inicial/app/pages/welcome/welcome.dart';
import 'package:tutorial_inicial/app/routes/routes.dart';

List<GetPage> getAppPages() {
  return [
    // Welcome
    GetPage<void>(name: Routes.WELCOME, page: () => Welcome()),

    // CategoryList
    GetPage<void>(
        name: Routes.CATEGORY, page: () => CategoryList(), binding: BindingsBuilder(() => Get.lazyPut(() => CategoryListController(), fenix: true))),

    // Info
    GetPage<void>(name: Routes.INFO, page: () => Info()),
  ];
}
