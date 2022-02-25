import 'package:get/get.dart';

String categoryNameLocated(String categoryName) {
  categoryName = categoryName.replaceAll(' ', '_').toLowerCase();

  return 'category_$categoryName'.tr;
}

String unitNameLocated(String unitName) {
  unitName = unitName.replaceAll(' ', '_').toLowerCase();

  return 'unit_$unitName'.tr;
}
