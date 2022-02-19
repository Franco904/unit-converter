import 'package:get/get.dart';
import 'package:tutorial_inicial/app/modules/category_list/category_list_page.dart';
import 'package:tutorial_inicial/app/modules/category_list/category_list_controller.dart';
import 'package:tutorial_inicial/app/modules/splash/splash_screen_controller.dart';
import 'package:tutorial_inicial/app/modules/splash/splash_screen_page.dart';
import 'package:tutorial_inicial/app/modules/unit_converter/unit_converter_controller.dart';
import 'package:tutorial_inicial/app/modules/unit_converter/unit_converter_page.dart';
import 'package:tutorial_inicial/app/pages/info/info_page.dart';
import 'package:tutorial_inicial/app/pages/welcome/welcome_page.dart';
import 'package:tutorial_inicial/app/routes/routes.dart';

List<GetPage> getAppPages() {
  return [
    // Splash
    GetPage<void>(
        name: Routes.SPLASH,
        page: () => SplashScreenPage(),
        binding: BindingsBuilder(() => Get.lazyPut(() => SplashScreenController(), fenix: true))),

    // Welcome
    GetPage<void>(name: Routes.WELCOME, page: () => WelcomePage()),

    // CategoryList
    GetPage<void>(
        name: Routes.CATEGORY,
        page: () => CategoryListPage(),
        binding: BindingsBuilder(() => Get.lazyPut(() => CategoryListController(), fenix: true))),

    // UnitConverter
    GetPage<void>(
        name: Routes.CONVERTER,
        page: () => UnitConverterPage(),
        binding: BindingsBuilder(() => Get.lazyPut(() => UnitConverterController(), fenix: true))),

    // Info
    GetPage<void>(name: Routes.INFO, page: () => InfoPage()),
  ];
}
