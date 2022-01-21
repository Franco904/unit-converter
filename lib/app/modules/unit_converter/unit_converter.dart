import 'dart:math';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:tutorial_inicial/app/core/controllers/locale_controller.dart';
import 'package:tutorial_inicial/app/data/model/category.dart';
import 'package:tutorial_inicial/app/modules/unit_converter/unit_converter_controller.dart';

class UnitConverter extends GetView<UnitConverterController> {
  final LocaleController localeController = Get.find<LocaleController>();

  final Category category;

  UnitConverter({required this.category});

  // TODO: HintTooltip para alertar a função do botão converter

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<UnitConverterController>()) {
      Get.put(UnitConverterController());
    }

    final englishInputString = 'converter_title'.tr + ' ${category.name.toLowerCase()} ' + 'converter_text_value'.tr;
    final elseInputString = 'converter_title'.tr + ' ' + 'converter_text_value'.tr + ' ${category.name.toLowerCase()}';

    final englishDropdownString = 'converter_dropdown_label'.tr + ' ${category.name.toLowerCase()} ' + 'converter_text_unit'.tr;
    final elseDropdownString = 'converter_dropdown_label'.tr + ' ' + 'converter_text_unit'.tr + ' ${category.name.toLowerCase()}';

    return WillPopScope(
      onWillPop: () => _onBackPressed(),
      child: Scaffold(
          appBar: AppBar(title: Text(category.name), centerTitle: true, backgroundColor: Colors.cyan),
          body: Padding(
            padding: EdgeInsets.only(top: 40),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        LocaleController.currentLocale == localeController.locales[0]['locale'] ? englishInputString : elseInputString,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    _buildInput(englishDropdownString, elseDropdownString),
                    _buildArrows(),
                    _buildOutput(englishDropdownString, elseDropdownString),
                  ],
                ),
              ),
            ),
          ),
          resizeToAvoidBottomInset: false),
    );
  }

  Future<bool> _onBackPressed() async {
    if (controller.formHasFieldsInitialized()) {
      controller.clearFields();
    }
    return true;
  }

  Widget _buildInput(String englishDropdownString, String elseDropdownString) {
    return Padding(
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
            validator: (value) => value == null || value.isEmpty ? 'converter_input_validation'.tr : null),
        SizedBox(height: 16),
        DropdownButtonFormField<String>(
            value: controller.fromUnit,
            hint: Text(LocaleController.currentLocale == localeController.locales[0]['locale'] ? englishDropdownString : elseDropdownString),
            icon: Icon(Icons.arrow_drop_down),
            decoration: InputDecoration(border: OutlineInputBorder()),
            validator: (dropdown) => dropdown == null || dropdown.isEmpty ? 'converter_dropdown_validation'.tr : null,
            onChanged: (newValue) => _updateDropdownInput(newValue),
            items: category.units.map((u) => DropdownMenuItem<String>(value: u.name, child: Text(u.name))).toList()),
      ]),
    );
  }

  Widget _buildArrows() {
    return RotatedBox(
      quarterTurns: 1,
      child: Center(
        child: IconButton(
          onPressed: () => _onConvertPressed(controller.formKey),
          icon: Icon(
            Icons.compare_arrows_rounded,
            color: Colors.cyan[600],
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildOutput(String englishDropdownString, String elseDropdownString) {
    return Padding(
      padding: EdgeInsets.only(top: 24, right: 24, bottom: 24, left: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        DropdownButtonFormField<String>(
            value: controller.toUnit,
            hint: Text(LocaleController.currentLocale == localeController.locales[0]['locale'] ? englishDropdownString : elseDropdownString),
            icon: Icon(Icons.arrow_drop_down),
            decoration: InputDecoration(border: OutlineInputBorder()),
            validator: (dropdown) => dropdown == null || dropdown.isEmpty ? 'converter_dropdown_validation'.tr : null,
            onChanged: (newValue) => _updateDropdownOutput(newValue),
            items: category.units.map((u) => DropdownMenuItem<String>(value: u.name, child: Text(u.name))).toList()),
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
    );
  }

  void _updateDropdownInput(String? newValue) {
    controller.fromUnit = newValue;

    category.units.forEach((u) {
      if (u.name == newValue) {
        controller.fromUnitId = u.id;
      }
    });
  }

  void _updateDropdownOutput(String? newValue) {
    controller.toUnit = newValue;

    category.units.forEach((u) {
      if (u.name == newValue) {
        controller.toUnitId = u.id;
      }
    });
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

    num inputValue = int.parse(controller.inputString);
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
        exponent = controller.fromUnitId - controller.toUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Mass
      case 4:
        base = 10;
        exponent = controller.fromUnitId - controller.toUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Time
      case 5:
        base = 60;
        exponent = controller.fromUnitId - controller.toUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Digital Storage
      case 6:
        base = pow(2, 10);
        exponent = controller.fromUnitId - controller.toUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Currency
      case 7:
        // TODO: Como faço para buscar a cotação atualizada das moedas?

        if (controller.fromUnit == 'unit_real'.tr && controller.toUnit == 'unit_dolar'.tr) {
          outputValue = inputValue / 5.53;
        } else if (controller.fromUnit == 'unit_dolar'.tr && controller.toUnit == 'unit_real'.tr) {
          outputValue = inputValue * 5.53;
        } else if (controller.fromUnit == 'unit_real'.tr && controller.toUnit == 'unit_euro'.tr) {
          outputValue = inputValue / 6.28;
        } else if (controller.fromUnit == 'unit_euro'.tr && controller.toUnit == 'unit_real'.tr) {
          outputValue = inputValue * 6.28;
        } else if (controller.fromUnit == 'unit_dolar'.tr && controller.toUnit == 'unit_euro'.tr) {
          outputValue = inputValue / 1.13;
        } else if (controller.fromUnit == 'unit_euro'.tr && controller.toUnit == 'unit_dolar'.tr) {
          outputValue = inputValue * 1.13;
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
        exponent = controller.fromUnitId - controller.toUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Temperature
      case 14:
        if (controller.fromUnit == 'unit_kelvin'.tr && controller.toUnit == 'unit_celsius'.tr) {
          outputValue = inputValue - 273;
        } else if (controller.fromUnit == 'unit_celsius'.tr && controller.toUnit == 'unit_kelvin'.tr) {
          outputValue = inputValue + 273;
        } else if (controller.fromUnit == 'unit_fahrenheit'.tr && controller.toUnit == 'unit_celsius'.tr) {
          outputValue = (5 * inputValue - 160) / 9;
        } else if (controller.fromUnit == 'unit_celsius'.tr && controller.toUnit == 'unit_fahrenheit'.tr) {
          outputValue = (9 * inputValue) / 5 + 32;
        } else if (controller.fromUnit == 'unit_fahrenheit'.tr && controller.toUnit == 'unit_kelvin'.tr) {
          outputValue = (5 * inputValue - 160) / 9 + 273;
        } else if (controller.fromUnit == 'unit_kelvin'.tr && controller.toUnit == 'unit_fahrenheit'.tr) {
          outputValue = (9 * inputValue - 2457) / 5 + 32;
        } else {
          outputValue = inputValue;
        }
        break;

      // Speed
      case 15:
        base = 3.6;
        exponent = controller.toUnitId - controller.fromUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      default:
        print('Unit not found.');
    }
    // TODO: Como imprimir output com separação de casas decimais?
    // var formatter = NumberFormat('#,##,000');

    controller.outputString.value = outputValue.toString();
  }
}
