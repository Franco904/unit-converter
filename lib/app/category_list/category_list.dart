import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/category_list/category.dart';
import 'package:tutorial_inicial/app/category_list/category_list_controller.dart';
import 'package:tutorial_inicial/app/category_list/category_tile.dart';
import 'package:tutorial_inicial/app/info/info.dart';

class CategoryList extends GetView<CategoryListController> {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CategoryListController>()) {
      Get.put(CategoryListController());
    }

    return Scaffold(
      appBar: AppBar(title: Text('Categories'), centerTitle: true, backgroundColor: Colors.cyan, automaticallyImplyLeading: false),
      body: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? ListView.builder(
                itemCount: controller.categories.length,
                itemBuilder: (BuildContext context, int i) {
                  return Padding(padding: EdgeInsets.only(left: 10), child: CategoryTile(category: controller.categories[i]));
                })
            : GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 5,
                children: controller.categories.map((Category c) {
                  return Padding(padding: EdgeInsets.only(left: 40, right: 30), child: CategoryTile(category: c));
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
