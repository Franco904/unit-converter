import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/data/model/conversion/categories.dart';
import 'package:tutorial_inicial/app/data/model/conversion/icategory_conversion.dart';

class CategoryDao {
  static CategoryDao get instance => Get.find<CategoryDao>();

  List<String> getCategoryNames() {
    return [
      'Length',
      'Area',
      'Volume',
      'Mass',
      'Time',
      'Digital Storage',
      'Currency',
      'Energy',
      'Eletrical Resistance',
      'Eletrical Charge',
      'Voltage',
      'Frequency',
      'Pressure',
      'Temperature',
      'Speed',
    ];
  }

  List<IconData> getCategoryIcons() {
    return [
      Icons.bar_chart_rounded,
      Icons.aspect_ratio_rounded,
      Ionicons.cube_outline,
      Ionicons.barbell_outline,
      Icons.timer_outlined,
      Icons.memory_rounded,
      Icons.attach_money_rounded,
      Icons.lightbulb_outline,
      Icons.align_horizontal_center_sharp,
      Icons.battery_charging_full_rounded,
      Icons.electrical_services_rounded,
      Icons.waves_rounded,
      Ionicons.speedometer_outline,
      Icons.thermostat_rounded,
      Icons.speed_rounded,
    ];
  }

  List<ICategoryConversion> getCategoryConversion() {
    return [
      Length(),
      Area(),
      Volume(),
      Mass(),
      Time(),
      DigitalStorage(),
      Currency(),
      Energy(),
      EletricalResistance(),
      EletricalCharge(),
      Voltage(),
      Frequency(),
      Pressure(),
      Temperature(),
      Speed(),
    ];
  }
}
