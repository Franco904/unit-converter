// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tutorial_inicial/app/category/category.dart';
import 'package:tutorial_inicial/app/conversion/unit_converter.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  // final ValueChanged<Category> onTap;

  const CategoryTile({
    Key? key,
    required this.category
  }) : super(key: key);

  // Monta cada uma das opções do ListView de categorias
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: 55,
        child: InkWell(
          highlightColor: Colors.grey[300],
          splashColor: Colors.grey[350],
          onTap: () => _toUnitConverter(context),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    category.icon,
                    size: 25,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      category.name,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
            ]),
          ),
        ),
      ),
    );  
  }

  // Navega para UnitConverter
  void _toUnitConverter(BuildContext context) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => UnitConverter(category: category)
      ),
    );
  }
}