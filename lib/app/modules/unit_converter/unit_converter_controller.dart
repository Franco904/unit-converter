import 'dart:math';

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

  void convertValue(Category category) {
    var currentCategoryId = category.id;

    num inputValue = int.parse(inputString);
    num outputValue = 0;

    num base = 0;
    num exponent = 0;

    // Conversão entre unidades (de cada categoria)
    switch (currentCategoryId) {
      // Length, Area & Volume
      case 1:
      case 2:
      case 3:
        base = pow(10, currentCategoryId);
        exponent = fromUnitId! - toUnitId!;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Mass
      case 4:
        base = 10;
        exponent = fromUnitId! - toUnitId!;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Time
      case 5:
        base = 60;
        exponent = fromUnitId! - toUnitId!;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Digital Storage
      case 6:
        base = pow(2, 10);
        exponent = fromUnitId! - toUnitId!;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Currency
      case 7:
        // From unit dollar
        if (fromUnit == 'unit_dollar'.tr && toUnit == 'unit_canadian_dollar'.tr) {
          outputValue = inputValue * 1.27;
        } else if (fromUnit == 'unit_dollar'.tr && toUnit == 'unit_euro'.tr) {
          outputValue = inputValue * 0.88;
        } else if (fromUnit == 'unit_dollar'.tr && toUnit == 'unit_real'.tr) {
          outputValue = inputValue * 5.25;
        } else if (fromUnit == 'unit_dollar'.tr && toUnit == 'unit_argentine_peso'.tr) {
          outputValue = inputValue * 106.44;
        }

        // From unit canadian dollar
        else if (fromUnit == 'unit_canadian_dollar'.tr && toUnit == 'unit_dollar'.tr) {
          outputValue = inputValue * 0.79;
        } else if (fromUnit == 'unit_canadian_dollar'.tr && toUnit == 'unit_euro'.tr) {
          outputValue = inputValue * 0.69;
        } else if (fromUnit == 'unit_canadian_dollar'.tr && toUnit == 'unit_real'.tr) {
          outputValue = inputValue * 4.13;
        } else if (fromUnit == 'unit_canadian_dollar'.tr && toUnit == 'unit_argentine_peso'.tr) {
          outputValue = inputValue * 83.58;
        }

        // From unit euro
        else if (fromUnit == 'unit_euro'.tr && toUnit == 'unit_dollar'.tr) {
          outputValue = inputValue * 1.14;
        } else if (fromUnit == 'unit_euro'.tr && toUnit == 'unit_canadian_dollar'.tr) {
          outputValue = inputValue * 1.45;
        } else if (fromUnit == 'unit_euro'.tr && toUnit == 'unit_real'.tr) {
          outputValue = inputValue * 5.96;
        } else if (fromUnit == 'unit_euro'.tr && toUnit == 'unit_argentine_peso'.tr) {
          outputValue = inputValue * 120.81;
        }

        // From unit real
        else if (fromUnit == 'unit_real'.tr && toUnit == 'unit_dollar'.tr) {
          outputValue = inputValue * 0.19;
        } else if (fromUnit == 'unit_real'.tr && toUnit == 'unit_canadian_dollar'.tr) {
          outputValue = inputValue * 0.24;
        } else if (fromUnit == 'unit_real'.tr && toUnit == 'unit_euro'.tr) {
          outputValue = inputValue * 0.17;
        } else if (fromUnit == 'unit_real'.tr && toUnit == 'unit_argentine_peso'.tr) {
          outputValue = inputValue * 20.26;
        }

        // From unit argentine peso
        else if (fromUnit == 'unit_argentine_peso'.tr && toUnit == 'unit_dollar'.tr) {
          outputValue = inputValue * 0.0093;
        } else if (fromUnit == 'unit_argentine_peso'.tr && toUnit == 'unit_canadian_dollar'.tr) {
          outputValue = inputValue * 0.012;
        } else if (fromUnit == 'unit_argentine_peso'.tr && toUnit == 'unit_euro'.tr) {
          outputValue = inputValue * 0.0083;
        } else if (fromUnit == 'unit_argentine_peso'.tr && toUnit == 'unit_real'.tr) {
          outputValue = inputValue * 0.049;
        } else {
          outputValue = inputValue;
        }

        outputValue = num.parse(outputValue.toStringAsFixed(2));

        break;

      // Energy, E. Resistance, E. Charge, Voltage, Frequency & Pressure
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
        base = pow(10, 3);
        exponent = fromUnitId! - toUnitId!;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Temperature
      case 14:
        if (fromUnit == 'unit_kelvin'.tr && toUnit == 'unit_celsius'.tr) {
          outputValue = inputValue - 273;
        } else if (fromUnit == 'unit_celsius'.tr && toUnit == 'unit_kelvin'.tr) {
          outputValue = inputValue + 273;
        } else if (fromUnit == 'unit_fahrenheit'.tr && toUnit == 'unit_celsius'.tr) {
          outputValue = (5 * inputValue - 160) / 9;
        } else if (fromUnit == 'unit_celsius'.tr && toUnit == 'unit_fahrenheit'.tr) {
          outputValue = (9 * inputValue) / 5 + 32;
        } else if (fromUnit == 'unit_fahrenheit'.tr && toUnit == 'unit_kelvin'.tr) {
          outputValue = (5 * inputValue - 160) / 9 + 273;
        } else if (fromUnit == 'unit_kelvin'.tr && toUnit == 'unit_fahrenheit'.tr) {
          outputValue = (9 * inputValue - 2457) / 5 + 32;
        } else {
          outputValue = inputValue;
        }
        break;

      // Speed
      case 15:
        base = 3.6;
        exponent = toUnitId! - fromUnitId!;

        outputValue = inputValue * pow(base, exponent);
        break;

      default:
        print('Unit not found.');
    }

    // var formatter = NumberFormat('#,##,000');

    outputString.value = outputValue.toString();
  }
}
