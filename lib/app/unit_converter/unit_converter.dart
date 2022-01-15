import 'dart:math';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:tutorial_inicial/app/category_list/category.dart';
import 'package:tutorial_inicial/app/unit_converter/unit_converter_controller.dart';

class UnitConverter extends GetView<UnitConverterController> {
  final Category category;

  const UnitConverter({required this.category});

  // TODO: HintTooltip para alertar a função do botão converter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Input ${category.name.toLowerCase()} value',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  input(context),
                  arrows(context),
                  output(context),
                ],
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false);
  }

  Widget input(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24, right: 24, bottom: 24, left: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Input',
            labelStyle: TextStyle(
              color: Colors.grey[600],
            ),
            contentPadding: EdgeInsets.only(left: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          ),
          onChanged: (value) => controller.inputString = value,
          validator: (value) => value == null || value.isEmpty ? 'Please input a convert value' : null,
        ),
        SizedBox(height: 16),
        DropdownButtonFormField<String>(
            value: controller.fromUnit,
            hint: Text('Select a ${category.name.toLowerCase()} unit'),
            icon: Icon(Icons.arrow_drop_down),
            decoration: InputDecoration(border: OutlineInputBorder()),
            validator: (dropdown) => dropdown == null || dropdown.isEmpty ? 'Required' : null,
            onChanged: (newValue) => _updateDropdownInput(newValue),
            items: category.units.map((u) => DropdownMenuItem<String>(value: u.name, child: Text(u.name))).toList()),
      ]),
    );
  }

  Widget arrows(BuildContext context) {
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

  Widget output(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24, right: 24, bottom: 24, left: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        DropdownButtonFormField<String>(
            value: controller.toUnit,
            hint: Text('Select a ${category.name.toLowerCase()} unit'),
            icon: Icon(Icons.arrow_drop_down),
            decoration: InputDecoration(border: OutlineInputBorder()),
            validator: (dropdown) => dropdown == null || dropdown.isEmpty ? 'Required' : null,
            onChanged: (newValue) => _updateDropdownOutput(newValue),
            items: category.units.map((u) => DropdownMenuItem<String>(value: u.name, child: Text(u.name))).toList()),
        SizedBox(height: 16),
        InputDecorator(
          child: Obx(() => Text(controller.outputString.value)),
          decoration: InputDecoration(
            hoverColor: Colors.grey[200],
            labelText: 'Output',
            labelStyle: Theme.of(context).textTheme.subtitle1,
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

        if (controller.fromUnit == 'Real' && controller.toUnit == 'Dolar') {
          outputValue = inputValue / 5.53;
        } else if (controller.fromUnit == 'Dolar' && controller.toUnit == 'Real') {
          outputValue = inputValue * 5.53;
        } else if (controller.fromUnit == 'Real' && controller.toUnit == 'Euro') {
          outputValue = inputValue / 6.28;
        } else if (controller.fromUnit == 'Euro' && controller.toUnit == 'Real') {
          outputValue = inputValue * 6.28;
        } else if (controller.fromUnit == 'Dolar' && controller.toUnit == 'Euro') {
          outputValue = inputValue / 1.13;
        } else if (controller.fromUnit == 'Euro' && controller.toUnit == 'Dolar') {
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
        if (controller.fromUnit == 'Kelvin' && controller.toUnit == 'Celsius') {
          outputValue = inputValue - 273;
        } else if (controller.fromUnit == 'Celsius' && controller.toUnit == 'Kelvin') {
          outputValue = inputValue + 273;
        } else if (controller.fromUnit == 'Fahrenheit' && controller.toUnit == 'Celsius') {
          outputValue = (5 * inputValue - 160) / 9;
        } else if (controller.fromUnit == 'Celsius' && controller.toUnit == 'Fahrenheit') {
          outputValue = (9 * inputValue) / 5 + 32;
        } else if (controller.fromUnit == 'Fahrenheit' && controller.toUnit == 'Kelvin') {
          outputValue = (5 * inputValue - 160) / 9 + 273;
        } else if (controller.fromUnit == 'Kelvin' && controller.toUnit == 'Fahrenheit') {
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
