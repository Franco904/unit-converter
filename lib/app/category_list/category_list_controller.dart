import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/category_list/category_list_repository.dart';
import 'package:tutorial_inicial/app/unit_converter/unit.dart';
import 'category.dart';

class CategoryListController extends GetxController {
  late List<String> categoryNames = <String>[];
  late List<IconData> categoryIcons = <IconData>[];

  final List<Category> categories = <Category>[];
  final List<Unit> units = <Unit>[];

  @override
  void onInit() {
    super.onInit();

    categoryNames = CategoryListRepository.instance.getCategoryNames();
    categoryIcons = CategoryListRepository.instance.getCategoryIcons();

    for (int i = 0; i < categoryNames.length; i++) {
      categories.add(Category(id: (i + 1), name: categoryNames[i], icon: categoryIcons[i], units: retrieveUnitList(i + 1)));
    } 
  }

  List<Unit> retrieveUnitList(int idCategory) {
    loadUnits(idCategory).then((unitList) { 
      unitList.forEach((u) {
        units.add(u);
      });
    });

    return units;
  }

  Future<List<Unit>> loadUnits(int idCategory) async {
    return (await CategoryListRepository.instance.getUnitsFromCategoryId(idCategory));
  }
}
