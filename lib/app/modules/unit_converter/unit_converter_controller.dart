import 'package:get/get.dart';
import 'package:tutorial_inicial/app/data/model/category.dart';
import 'package:tutorial_inicial/app/core/utils/strings.dart';
import 'package:tutorial_inicial/app/data/model/conversion/icategory_conversion.dart';
import 'package:tutorial_inicial/app/data/repositories/category_list_repository.dart';

class UnitConverterController extends GetxController {
  String? fromUnit;
  String? toUnit;

  int? fromUnitId;
  int? toUnitId;

  String inputString = '';
  RxString outputString = ''.obs;

  CategoryListRepository categoryListRepository = CategoryListRepository.instance;

  bool formHasFieldsInitialized() {
    return !(inputString == '' && outputString.value == '' && fromUnit == null && toUnit == null);
  }

  void clearFields() {
    inputString = outputString.value = '';
    fromUnit = toUnit = null;
  }

  void updateDropdown(String? newValue, Category category, bool isInput) {
    isInput ? fromUnit = newValue! : toUnit = newValue!;

    category.units.forEach((u) {
      if (unitNameLocated(u.name) == newValue) {
        isInput ? fromUnitId = u.id : toUnitId = u.id;
      }
    });
  }

  void convertValue(Category category) {
    num inputValue = num.parse(inputString.replaceAll(',', '.'));

    ICategoryConversion categoryConversion = categoryListRepository.getCategoryConversion(category.id);

    outputString.value = categoryConversion.convert(category.id, fromUnitId, toUnitId, inputValue);
    // var formatter = NumberFormat('#,##,000');
  }
}
