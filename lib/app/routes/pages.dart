import 'package:get/get.dart';
import 'package:tutorial_inicial/app/category_list/category_list.dart';
import 'package:tutorial_inicial/app/category_list/category_list_controller.dart';
import 'package:tutorial_inicial/app/info/info.dart';
import 'package:tutorial_inicial/app/routes/routes.dart';
// import 'package:tutorial_inicial/app/unit_converter/unit_converter.dart';
import 'package:tutorial_inicial/app/welcome/welcome.dart';

List<GetPage> getAppPages() {
  return [
    // Welcome
    GetPage<void>(name: Routes.WELCOME, page: () => Welcome()),

    // CategoryList
    GetPage<void>(
      name: Routes.CATEGORY,
      page: () => CategoryList(),
      binding: BindingsBuilder(() => Get.lazyPut(() => CategoryListController()))
    ),

    // UnitConverter
    // GetPage<void>(name: Routes.CONVERTER, page: () => UnitConverter()),

    // Info
    GetPage<void>(name: Routes.INFO, page: () => Info()),
  ];
}
