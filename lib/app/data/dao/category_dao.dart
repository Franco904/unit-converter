import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      Icons.adjust_rounded,
      Icons.amp_stories_outlined,
      Icons.timer_rounded,
      Icons.memory_rounded,
      Icons.attach_money_rounded,
      Icons.lightbulb_outline,
      Icons.align_horizontal_center_sharp,
      Icons.battery_charging_full_rounded,
      Icons.electrical_services_rounded,
      Icons.waves_rounded,
      Icons.text_rotation_down_sharp,
      Icons.thermostat_rounded,
      Icons.speed_rounded,
    ];
  }
}
