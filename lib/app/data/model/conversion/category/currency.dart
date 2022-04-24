import 'package:tutorial_inicial/app/data/model/conversion/conversion.dart';
import 'package:tutorial_inicial/app/data/model/conversion/icategory_conversion.dart';

class Currency extends Conversion implements ICategoryConversion {
  @override
  String convert(int currentCategoryId, int? fromUnitId, int? toUnitId, num inputValue) {
    // 36: Dollar
    // 37: Canadian dollar
    // 38: Euro
    // 39: Real
    // 40: Argentine peso

    // From unit dollar
    if (fromUnitId == 36 && toUnitId == 37) {
      outputValue = inputValue * 1.27;
    } else if (fromUnitId == 36 && toUnitId == 38) {
      outputValue = inputValue * 0.88;
    } else if (fromUnitId == 36 && toUnitId == 39) {
      outputValue = inputValue * 5.25;
    } else if (fromUnitId == 36 && toUnitId == 40) {
      outputValue = inputValue * 106.44;
    }

    // From unit canadian dollar
    else if (fromUnitId == 37 && toUnitId == 36) {
      outputValue = inputValue * 0.79;
    } else if (fromUnitId == 37 && toUnitId == 38) {
      outputValue = inputValue * 0.69;
    } else if (fromUnitId == 37 && toUnitId == 39) {
      outputValue = inputValue * 4.13;
    } else if (fromUnitId == 37 && toUnitId == 40) {
      outputValue = inputValue * 83.58;
    }

    // From unit euro
    else if (fromUnitId == 38 && toUnitId == 36) {
      outputValue = inputValue * 1.14;
    } else if (fromUnitId == 38 && toUnitId == 37) {
      outputValue = inputValue * 1.45;
    } else if (fromUnitId == 38 && toUnitId == 39) {
      outputValue = inputValue * 5.96;
    } else if (fromUnitId == 38 && toUnitId == 40) {
      outputValue = inputValue * 120.81;
    }

    // From unit real
    else if (fromUnitId == 39 && toUnitId == 36) {
      outputValue = inputValue * 0.19;
    } else if (fromUnitId == 39 && toUnitId == 37) {
      outputValue = inputValue * 0.24;
    } else if (fromUnitId == 39 && toUnitId == 38) {
      outputValue = inputValue * 0.17;
    } else if (fromUnitId == 39 && toUnitId == 40) {
      outputValue = inputValue * 20.26;
    }

    // From unit argentine peso
    else if (fromUnitId == 40 && toUnitId == 36) {
      outputValue = inputValue * 0.0093;
    } else if (fromUnitId == 40 && toUnitId == 37) {
      outputValue = inputValue * 0.012;
    } else if (fromUnitId == 40 && toUnitId == 38) {
      outputValue = inputValue * 0.0083;
    } else if (fromUnitId == 40 && toUnitId == 39) {
      outputValue = inputValue * 0.049;
    } else {
      outputValue = inputValue;
    }

    outputValue = num.parse(outputValue.toStringAsFixed(2));

    return outputValue.toString();
  }
}
