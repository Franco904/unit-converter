import 'package:get/get.dart';
import 'package:tutorial_inicial/app/core/controllers/locale_controller.dart';
import 'package:tutorial_inicial/app/data/dao/category_dao.dart';
import 'package:tutorial_inicial/app/data/dao/unit_dao.dart';
import 'package:tutorial_inicial/app/data/repositories/category_list_repository.dart';
import 'package:tutorial_inicial/app/modules/unit_converter/unit_converter_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CategoryDao>(CategoryDao(), permanent: true);
    Get.put<UnitDao>(UnitDao(), permanent: true);

    Get.put<CategoryListRepository>(CategoryListRepository(), permanent: true);

    Get.put<LocaleController>(LocaleController(), permanent: true);

    Get.lazyPut<UnitConverterController>(() => UnitConverterController());
  }
}
