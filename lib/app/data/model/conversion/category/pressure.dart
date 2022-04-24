import 'dart:math';

import 'package:tutorial_inicial/app/data/model/conversion/conversion.dart';
import 'package:tutorial_inicial/app/data/model/conversion/icategory_conversion.dart';

class Pressure extends Conversion implements ICategoryConversion {
  @override
  String convert(int currentCategoryId, int? fromUnitId, int? toUnitId, num inputValue) {
    base = pow(10, 3);
    exponent = fromUnitId! - toUnitId!;

    outputValue = inputValue * pow(base, exponent);

    return outputValue.toString();
  }
}
