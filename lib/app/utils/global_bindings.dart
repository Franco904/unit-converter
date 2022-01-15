import 'package:get/get.dart';
import 'package:tutorial_inicial/app/category_list/category_dao.dart';
import 'package:tutorial_inicial/app/category_list/category_list_repository.dart';
import 'package:tutorial_inicial/app/category_list/unit_dao.dart';

class GlobalBindings extends Bindings {

  @override
  void dependencies() {
    Get.put<CategoryListRepository>(CategoryListRepository(), permanent: true);

    Get.put<CategoryDao>(CategoryDao(), permanent: true);
    Get.put<UnitDao>(UnitDao(), permanent: true);
  }
}