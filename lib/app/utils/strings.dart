import 'package:tutorial_inicial/app/data/model/category.dart';

import 'package:get/get.dart';

String converterStrings(String convertionKey, Category category) {
  final categoryName = categoryNameLocated(category.name);

  switch (convertionKey) {
    case 'english_input_string':
      return 'converter_title'.tr + ' ${categoryName.toLowerCase()} ' + 'converter_text_value'.tr;

    case 'else_input_string':
      return 'converter_title'.tr + ' ' + 'converter_text_value'.tr + ' ${categoryName.toLowerCase()}';

    default:
      return categoryName;
  }
}

String categoryNameLocated(String categoryName) {
  categoryName = categoryName.replaceAll(' ', '_').toLowerCase();

  return 'category_$categoryName'.tr;
}

String unitNameLocated(String unitName) {
  unitName = unitName.replaceAll(' ', '_').toLowerCase();

  return 'unit_$unitName'.tr;
}
