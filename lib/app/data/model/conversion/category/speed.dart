import 'dart:math';

import 'package:tutorial_inicial/app/data/model/conversion/conversion.dart';
import 'package:tutorial_inicial/app/data/model/conversion/icategory_conversion.dart';

class Speed extends Conversion implements ICategoryConversion {
  @override
  String convert(int currentCategoryId, int? fromUnitId, int? toUnitId, num inputValue) {
    base = 3.6;
    exponent = toUnitId! - fromUnitId!;

    outputValue = inputValue * pow(base, exponent);

    return outputValue.toString();
  }
}
