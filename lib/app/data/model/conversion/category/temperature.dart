import 'package:tutorial_inicial/app/data/model/conversion/conversion.dart';
import 'package:tutorial_inicial/app/data/model/conversion/icategory_conversion.dart';

class Temperature extends Conversion implements ICategoryConversion {
  @override
  String convert(int currentCategoryId, int? fromUnitId, int? toUnitId, num inputValue) {
    // 64: Kelvin
    // 65: Celsius
    // 66: Fahrenheit

    if (fromUnitId == 64 && toUnitId == 65) {
      outputValue = inputValue - 273;
    } else if (fromUnitId == 65 && toUnitId == 64) {
      outputValue = inputValue + 273;
    } else if (fromUnitId == 66 && toUnitId == 65) {
      outputValue = (5 * inputValue - 160) / 9;
    } else if (fromUnitId == 65 && toUnitId == 66) {
      outputValue = (9 * inputValue) / 5 + 32;
    } else if (fromUnitId == 66 && toUnitId == 64) {
      outputValue = (5 * inputValue - 160) / 9 + 273;
    } else if (fromUnitId == 64 && toUnitId == 66) {
      outputValue = (9 * inputValue - 2457) / 5 + 32;
    } else {
      outputValue = inputValue;
    }
    return outputValue.toString();
  }
}
