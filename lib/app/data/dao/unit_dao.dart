import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/data/model/unit.dart';

class UnitDao {
  static UnitDao get instance => Get.find<UnitDao>();

  Future<List<Unit>> getUnitsFromCategoryId(int idCategory) async {
    final response = await rootBundle.loadString('lib/assets/data/units.json');
    final unitsJson = await jsonDecode(response);

    List<Unit> listUnit = [];

    for (Map<String, dynamic> u in unitsJson) {
      var unit = Unit.fromJson(u);
      if (unit.idCategory == idCategory) {
        unit.name = unitNameLocated(unit.name);
        listUnit.add(unit);
      }
    }

    return listUnit;
  }

  String unitNameLocated(String unitName) {
    unitName = unitName.replaceAll(' ', '_').toLowerCase();

    return 'unit_$unitName'.tr;
  }
}
