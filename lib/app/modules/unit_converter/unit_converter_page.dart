import 'dart:math';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:tutorial_inicial/app/core/controllers/locale_controller.dart';
import 'package:tutorial_inicial/app/core/utils/validations.dart';
import 'package:tutorial_inicial/app/data/model/category.dart';
import 'package:tutorial_inicial/app/modules/unit_converter/unit_converter_controller.dart';
import 'package:tutorial_inicial/app/utils/strings.dart';

class UnitConverterPage extends GetView<UnitConverterController> {
  final LocaleController localeController = Get.find<LocaleController>();

  final formKey = GlobalKey<FormState>();
  final Category category = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final englishInputString = converterStrings('english_input_string', category);
    final elseInputString = converterStrings('else_input_string', category);

    return WillPopScope(
      onWillPop: () => _onBackPressed(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            appBar: AppBar(title: Text(categoryNameLocated(category.name)), centerTitle: true, backgroundColor: Colors.cyan),
            body: Padding(
              padding: EdgeInsets.only(top: 40),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          localeController.currentLocale.value == localeController.locales[0]['locale'].toString()
                              ? englishInputString
                              : elseInputString,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 24, right: 24, bottom: 24, left: 20),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'converter_input_label'.tr,
                              labelStyle: TextStyle(
                                color: Colors.grey[600],
                              ),
                              contentPadding: EdgeInsets.only(left: 12),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                            ),
                            onChanged: (value) => controller.inputString = value,
                            validator: (value) => validateIntText(value),
                          ),
                          SizedBox(height: 16),
                          DropdownButtonFormField<String>(
                              value: controller.fromUnit,
                              hint: Text(categoryNameLocated(category.name)),
                              icon: Icon(Icons.arrow_drop_down),
                              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
                              validator: (dropdown) => validateDropdown(dropdown),
                              onChanged: (newValue) => controller.updateDropdown(newValue, category, true),
                              items: category.units.map((u) {
                                return DropdownMenuItem<String>(
                                  value: unitNameLocated(u.name),
                                  child: Text(unitNameLocated(u.name)),
                                );
                              }).toList()),
                        ]),
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Center(
                          child: IconButton(
                            tooltip: 'Converter',
                            onPressed: () => _onConvertPressed(formKey),
                            icon: Icon(
                              Icons.compare_arrows_rounded,
                              color: Colors.cyan[600],
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 24, right: 24, bottom: 24, left: 20),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                          DropdownButtonFormField<String>(
                              value: controller.toUnit,
                              hint: Text(categoryNameLocated(category.name)),
                              icon: Icon(Icons.arrow_drop_down),
                              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
                              validator: (dropdown) => validateDropdown(dropdown),
                              onChanged: (newValue) => controller.updateDropdown(newValue, category, false),
                              items: category.units.map((u) {
                                return DropdownMenuItem<String>(
                                  value: unitNameLocated(u.name),
                                  child: Text(unitNameLocated(u.name)),
                                );
                              }).toList()),
                          SizedBox(height: 16),
                          InputDecorator(
                            child: Obx(() => Text(controller.outputString.value)),
                            decoration: InputDecoration(
                              hoverColor: Colors.grey[200],
                              labelText: 'converter_output_label'.tr,
                              labelStyle: Theme.of(Get.context!).textTheme.subtitle1,
                              contentPadding: EdgeInsets.only(left: 12),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            resizeToAvoidBottomInset: false),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    if (controller.formHasFieldsInitialized()) {
      controller.clearFields();
    }
    return true;
  }

  void _onConvertPressed(GlobalKey<FormState> conversionKey) {
    conversionKey.currentState?.save();
    var isValid = conversionKey.currentState?.validate();

    if (isValid != null && isValid) {
      _convert();
    }
  }

  void _convert() {
    var currentCategoryId = category.id;

    var fromUnit = controller.fromUnit;
    var toUnit = controller.toUnit;
    var fromUnitId = controller.fromUnitId!;
    var toUnitId = controller.toUnitId!;

    num inputValue = int.parse(controller.inputString);
    num outputValue = 0;

    num base = 0;
    int exponent = 0;

    // Conversão entre unidades (de cada categoria)
    switch (currentCategoryId) {
      // Length, Area & Volume
      case 1:
      case 2:
      case 3:
        base = pow(10, currentCategoryId);
        exponent = fromUnitId - toUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Mass
      case 4:
        base = 10;
        exponent = fromUnitId - toUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Time
      case 5:
        base = 60;
        exponent = fromUnitId - toUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Digital Storage
      case 6:
        base = pow(2, 10);
        exponent = fromUnitId - toUnitId;

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
        exponent = fromUnitId - toUnitId;

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
        exponent = toUnitId - fromUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      default:
        print('Unit not found.');
    }

    // var formatter = NumberFormat('#,##,000');

    controller.outputString.value = outputValue.toString();
  }
}
