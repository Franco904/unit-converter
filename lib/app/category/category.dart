// ignore_for_file: avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tutorial_inicial/app/conversion/unit.dart';

class Category {
  final int id;
  final String name;
  final IconData icon;
  final List<Unit> units;

  const Category({
    required this.id, 
    required this.name, 
    required this.units,
    required this.icon
  });
}
