import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/data/dao/category_dao.dart';
import 'package:tutorial_inicial/app/data/dao/unit_dao.dart';
import 'package:tutorial_inicial/app/data/model/conversion/icategory_conversion.dart';
import 'package:tutorial_inicial/app/data/model/unit.dart';

class CategoryListRepository {
  static CategoryListRepository get instance => Get.find<CategoryListRepository>();

  List<String> getCategoryNames() {
    return CategoryDao.instance.getCategoryNames();
  }

  List<IconData> getCategoryIcons() {
    return CategoryDao.instance.getCategoryIcons();
  }

  ICategoryConversion getCategoryConversion(int idCategory) {
    return CategoryDao.instance.getCategoryConversion()[idCategory - 1];
  }

  Future<List<Unit>> getUnitsFromCategoryId(int idCategory) {
    return UnitDao.instance.getUnitsFromCategoryId(idCategory);
  }
}
