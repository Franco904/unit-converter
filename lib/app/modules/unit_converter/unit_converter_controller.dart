import 'package:get/get.dart';
import 'package:tutorial_inicial/app/data/model/category.dart';
import 'package:tutorial_inicial/app/utils/strings.dart';

class UnitConverterController extends GetxController {
  String? fromUnit;
  String? toUnit;

  int? fromUnitId;
  int? toUnitId;

  String inputString = '';
  RxString outputString = ''.obs;

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
}
