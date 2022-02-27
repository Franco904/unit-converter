import 'package:flutter/material.dart';
import 'package:tutorial_inicial/app/data/model/unit.dart';

class Category {
  final int id;
  final String name;
  final IconData icon;
  final List<Unit> units;

  const Category({required this.id, required this.name, required this.units, required this.icon}) : assert(id > 0);
}
