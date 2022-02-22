import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/data/model/category.dart';
import 'package:tutorial_inicial/app/routes/routes.dart';
import 'package:tutorial_inicial/app/utils/strings.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({required this.category});

  // Monta cada uma das opções de categorias
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 16,
            spreadRadius: -4,
            color: Colors.grey.shade200,
          ),
        ],
      ),
      child: Card(
        child: InkWell(
          splashColor: Colors.cyan.withOpacity(0.3),
          borderRadius: BorderRadius.circular(4),
          onTap: () {
             Get.toNamed(Routes.CONVERTER, arguments: category);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16, bottom: 16, left: 16),
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Center(child: Icon(category.icon)),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    categoryNameLocated(category.name),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
