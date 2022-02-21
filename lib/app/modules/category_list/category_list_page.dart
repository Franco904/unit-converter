import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/modules/category_list/category_list_controller.dart';
import 'package:tutorial_inicial/app/modules/category_list/local_widgets/category_tile.dart';
import 'package:tutorial_inicial/app/modules/category_list/local_widgets/converter_drawer.dart';

class CategoryListPage extends GetView<CategoryListController> {
  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CategoryListController>()) {
      Get.put(CategoryListController());
    }

    return WillPopScope(
      onWillPop: () async {
        if (controller.isDrawerOpen.value) {
          Get.back();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('categories_title'.tr),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.cyan[700]),
          leading: Builder(builder: (context) {
            controller.isDrawerOpen.value = Scaffold.of(context).isDrawerOpen;
            return IconButton(icon: const Icon(Icons.menu), onPressed: () => Scaffold.of(context).openDrawer());
          }),
        ),
        drawer: ConverterDrawer(),
        body: ListView.builder(
            itemCount: controller.categories.length,
            itemBuilder: (_, i) {
              return Padding(padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12), child: CategoryTile(category: controller.categories[i]));
            }),
      ),
    );
  }
}
