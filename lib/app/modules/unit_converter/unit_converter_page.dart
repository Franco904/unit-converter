import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:tutorial_inicial/app/core/controllers/locale_controller.dart';
import 'package:tutorial_inicial/app/core/utils/validations.dart';
import 'package:tutorial_inicial/app/data/model/category.dart';
import 'package:tutorial_inicial/app/modules/unit_converter/unit_converter_controller.dart';
import 'package:tutorial_inicial/app/core/utils/strings.dart';

class UnitConverterPage extends GetView<UnitConverterController> {
  final LocaleController localeController = Get.find<LocaleController>();

  final formKey = GlobalKey<FormState>();
  final Category category = Get.arguments;

  @override
  Widget build(BuildContext context) {
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
                          'converter_help_text'.tr,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
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
                              menuMaxHeight: 180,
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
                            tooltip: 'converter_button_tooltip'.tr,
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
                              menuMaxHeight: 180,
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
      controller.convertValue(category);
    }
  }
}
