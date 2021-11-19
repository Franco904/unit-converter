// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, unused_element, prefer_typing_uninitialized_variables, avoid_function_literals_in_foreach_calls

import 'dart:math';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:tutorial_inicial/app/category/category.dart';

class UnitConverter extends StatefulWidget {
  final Category category;

  const UnitConverter({Key? key, required this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  String? _fromUnit; // dropdownInput unit name
  String? _toUnit; // dropdownOutput unit name

  late int _fromUnitId; // dropdownInput unit id
  late int _toUnitId; // dropdownOutput unit id

  String _inputString = '';
  String _outputString = '';

  final _conversionKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // TODO: HintTooltip para alertar a função do botão converter
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.category.name),
            centerTitle: true,
            backgroundColor: Colors.cyan),
        body: Padding(
          padding: EdgeInsets.only(top: 40),
          child: SingleChildScrollView(
            child: Form(
              key: _conversionKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Input ${widget.category.name.toLowerCase()} value',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(child: input()),
                  Container(child: arrows()),
                  Container(child: output()),
                ],
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false);
  }

  input() {
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
          onChanged: (value) => _inputString = value,
          validator: (value) => value == null || value.isEmpty
              ? 'Please input a convert value'
              : null,
        ),
        SizedBox(height: 16),
        DropdownButtonFormField<String>(
            value: _fromUnit,
            hint: Text('Select a ${widget.category.name.toLowerCase()} unit'),
            icon: Icon(Icons.arrow_drop_down),
            decoration: InputDecoration(border: OutlineInputBorder()),
            validator: (dropdown) =>
                dropdown == null || dropdown.isEmpty ? 'Required' : null,
            onChanged: (newValue) => updateDropdownInput(newValue),
            items: widget.category.units
                .map((u) => DropdownMenuItem<String>(
                    value: u.name, child: Text(u.name)))
                .toList()),
      ]),
    );
  }

  arrows() {
    return RotatedBox(
      quarterTurns: 1,
      child: Center(
        child: IconButton(
          onPressed: () => onConvertPressed(_conversionKey),
          icon: Icon(
            Icons.compare_arrows_rounded,
            color: Colors.cyan[600],
            size: 30,
          ),
        ),
      ),
    );
  }

  output() {
    return Padding(
      padding: EdgeInsets.only(top: 24, right: 24, bottom: 24, left: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        DropdownButtonFormField<String>(
            value: _toUnit,
            hint: Text('Select a ${widget.category.name.toLowerCase()} unit'),
            icon: Icon(Icons.arrow_drop_down),
            decoration: InputDecoration(border: OutlineInputBorder()),
            validator: (dropdown) =>
                dropdown == null || dropdown.isEmpty ? 'Required' : null,
            onChanged: (newValue) => updateDropdownOutput(newValue),
            items: widget.category.units
                .map((u) => DropdownMenuItem<String>(
                    value: u.name, child: Text(u.name)))
                .toList()),
        SizedBox(height: 16),
        InputDecorator(
          child: Text(_outputString),
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

  updateDropdownInput(String? newValue) {
    setState(() {
      _fromUnit = newValue;

      widget.category.units.forEach((u) {
        if (u.name == newValue) {
          _fromUnitId = u.id;
        }
      });
    });
  }

  updateDropdownOutput(String? newValue) {
    setState(() {
      _toUnit = newValue;

      widget.category.units.forEach((u) {
        if (u.name == newValue) {
          _toUnitId = u.id;
        }
      });
    });
  }

  onConvertPressed(GlobalKey<FormState> conversionKey) {
    conversionKey.currentState?.save();
    var isValid = conversionKey.currentState?.validate();

    if (isValid != null && isValid) {
      convert();
    }
  }

  convert() {
    var currentCategoryId = widget.category.id;

    num inputValue = int.parse(_inputString);
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
        exponent = _fromUnitId - _toUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Mass
      case 4:
        base = 10;
        exponent = _fromUnitId - _toUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Time
      case 5:
        base = 60;
        exponent = _fromUnitId - _toUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Digital Storage
      case 6:
        base = pow(2, 10);
        exponent = _fromUnitId - _toUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Currency
      case 7:
        // TODO: Como faço para buscar a cotação atualizada das moedas?

        if (_fromUnit == 'Real' && _toUnit == 'Dolar') {
          outputValue = inputValue / 5.53;
        } else if (_fromUnit == 'Dolar' && _toUnit == 'Real') {
          outputValue = inputValue * 5.53;
        } else if (_fromUnit == 'Real' && _toUnit == 'Euro') {
          outputValue = inputValue / 6.28;
        } else if (_fromUnit == 'Euro' && _toUnit == 'Real') {
          outputValue = inputValue * 6.28;
        } else if (_fromUnit == 'Dolar' && _toUnit == 'Euro') {
          outputValue = inputValue / 1.13;
        } else if (_fromUnit == 'Euro' && _toUnit == 'Dolar') {
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
        exponent = _fromUnitId - _toUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      // Temperature
      case 14:
        if (_fromUnit == 'Kelvin' && _toUnit == 'Celsius') {
          outputValue = inputValue - 273;
        } else if (_fromUnit == 'Celsius' && _toUnit == 'Kelvin') {
          outputValue = inputValue + 273;
        } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Celsius') {
          outputValue = (5 * inputValue - 160) / 9;
        } else if (_fromUnit == 'Celsius' && _toUnit == 'Fahrenheit') {
          outputValue = (9 * inputValue) / 5 + 32;
        } else if (_fromUnit == 'Fahrenheit' && _toUnit == 'Kelvin') {
          outputValue = (5 * inputValue - 160) / 9 + 273;
        } else if (_fromUnit == 'Kelvin' && _toUnit == 'Fahrenheit') {
          outputValue = (9 * inputValue - 2457) / 5 + 32;
        } else {
          outputValue = inputValue;
        }
        break;

      // Speed
      case 15:
        base = 3.6;
        exponent = _toUnitId - _fromUnitId;

        outputValue = inputValue * pow(base, exponent);
        break;

      default:
        print('Unit not found.');
    }
    // TODO: Como imprimir output com separação de casas decimais?
    var formatter = NumberFormat('#,##,000');

    setState(() {
      _outputString = outputValue.toString();
    });
  }
}
