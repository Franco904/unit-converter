import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/area.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/currency.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/digital_storage.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/eletrical_charge.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/eletrical_resistance.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/energy.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/frequency.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/length.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/mass.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/pressure.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/speed.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/temperature.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/time.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/voltage.dart';
import 'package:tutorial_inicial/app/data/model/conversion/category/volume.dart';
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
