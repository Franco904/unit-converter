import 'package:tutorial_inicial/app/data/model/category.dart';

import 'package:get/get.dart';

String converterStrings(String convertionKey, Category category) {
  switch (convertionKey) {
    case 'english_input_string':
      return 'converter_title'.tr + ' ${category.name.toLowerCase()} ' + 'converter_text_value'.tr;

    case 'else_input_string':
      return 'converter_title'.tr + ' ' + 'converter_text_value'.tr + ' ${category.name.toLowerCase()}';

    default:
      return category.name;
  }
}
