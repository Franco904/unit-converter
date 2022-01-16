import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnitConverterController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String? fromUnit; // dropdownInput unit name
  String? toUnit; // dropdownOutput unit name

  late int fromUnitId; // dropdownInput unit id
  late int toUnitId; // dropdownOutput unit id

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
