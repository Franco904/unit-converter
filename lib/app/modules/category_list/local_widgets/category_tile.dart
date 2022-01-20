import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/data/model/category.dart';
import 'package:tutorial_inicial/app/modules/unit_converter/unit_converter.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({required this.category});

  // Monta cada uma das opções de categorias
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: InkWell(
        highlightColor: Colors.grey[300],
        splashColor: Colors.grey[350],
        onTap: () => Get.to(() => UnitConverter(category: category)),
        child: Padding(
          padding: EdgeInsets.only(top: 16, right: 16, bottom: 16, left: 24),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(child: Icon(category.icon, size: 25)),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  category.name,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
