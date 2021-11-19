// ignore_for_file: avoid_print, prefer_const_constructors, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tutorial_inicial/app/category/category.dart';
import 'package:tutorial_inicial/app/category/category_tile.dart';
import 'package:tutorial_inicial/app/conversion/unit.dart';
import 'package:tutorial_inicial/app/info/info.dart';

class CategoryRoute extends StatefulWidget {
  const CategoryRoute({Key? key}) : super(key: key);

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  static const _categoryNames = <String>[
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

  static const _categoryIcons = <IconData>[
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

  final List<Category> _categories = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < _categoryNames.length; i++) {
      _categories.add(Category(
          id: (i + 1),
          name: _categoryNames[i],
          icon: _categoryIcons[i],
          units: _retrieveUnitList(i + 1)));
    }
  }

  _retrieveUnitList(int idCategory) {
    List<Unit> listUnit = [];

    _getUnits(idCategory).then((units) {
      units.forEach((u) {
        listUnit.add(u);
      });
    });
    return listUnit;
  }

  Future<List<Unit>> _getUnits(int idCategory) async {
    final response = await rootBundle.loadString('lib/assets/data/units.json');

    final unitsJson = await jsonDecode(response);
    List<Unit> listUnit = [];

    for (Map<String, dynamic> u in unitsJson) {
      var unit = Unit.fromJson(u);
      if (unit.idCategory == idCategory) {
        listUnit.add(unit);
      }
    }

    return listUnit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          automaticallyImplyLeading: false
        ),
        body: OrientationBuilder(
          builder: (context, orientation) => orientation == Orientation.portrait
              ? ListView.builder(
                  itemCount: _categories.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: CategoryTile(category: _categories[i]));
                  })
              : GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 5,
                  children: _categories.map((Category c) {
                    return Padding(
                        padding: EdgeInsets.only(left: 40, right: 30),
                        child: CategoryTile(category: c));
                  }).toList()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _toInfo(context),
          child: Icon(Icons.info_outline_rounded),
          backgroundColor: Colors.cyan,
        ),
    );
  }

  // Navega para Info
  _toInfo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Info()),
    );
  }
}
