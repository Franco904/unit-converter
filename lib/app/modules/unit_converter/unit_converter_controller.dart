import 'package:get/get.dart';

class UnitConverterController extends GetxController {
  String? fromUnit;
  String? toUnit;

  late int fromUnitId;
  late int toUnitId;

  String inputString = '';
  RxString outputString = ''.obs;

  bool formHasFieldsInitialized() {
    return !(inputString == '' && outputString.value == '' && fromUnit == null && toUnit == null);
  }

  void clearFields() {
    inputString = outputString.value = '';
    fromUnit = toUnit = null;
  }
}
