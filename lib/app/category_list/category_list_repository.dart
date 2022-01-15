import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/category_list/category_dao.dart';
import 'package:tutorial_inicial/app/category_list/unit_dao.dart';
import 'package:tutorial_inicial/app/unit_converter/unit.dart';

class CategoryListRepository {
  static CategoryListRepository get instance => Get.find<CategoryListRepository>();

  List<String> getCategoryNames() {
    return CategoryDao.instance.getCategoryNames();
  }

  List<IconData> getCategoryIcons() {
    return CategoryDao.instance.getCategoryIcons();
  }

  Future<List<Unit>> getUnitsFromCategoryId(int idCategory) async {
    return (await UnitDao.instance.getUnitsFromCategoryId(idCategory));
  }
}