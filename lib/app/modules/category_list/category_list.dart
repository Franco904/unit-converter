import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/core/controllers/locale_controller.dart';
import 'package:tutorial_inicial/app/data/model/category.dart';
import 'package:tutorial_inicial/app/modules/category_list/category_list_controller.dart';
import 'package:tutorial_inicial/app/modules/category_list/local_widgets/category_tile.dart';
import 'package:tutorial_inicial/app/modules/category_list/local_widgets/locale_tile.dart';
import 'package:tutorial_inicial/app/pages/info/info.dart';
import 'package:tutorial_inicial/app/utils/device.dart';

class CategoryList extends GetView<CategoryListController> {
  final LocaleController localeController = Get.find<LocaleController>();

  CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CategoryListController>()) {
      Get.put(CategoryListController());
    } else {
      // Ver se existe uma lógica melhor para atualizar as categorias traduzidas
      Get.delete<CategoryListController>();
      Get.put(CategoryListController());
    }

    return Scaffold(
      appBar: AppBar(title: Text('categories_title'.tr), centerTitle: true, backgroundColor: Colors.cyan, automaticallyImplyLeading: false, actions: [
        IconButton(
          icon: const Icon(Icons.language_rounded),
          tooltip: 'categories_dialog_title'.tr,
          onPressed: () {
            _showSelectLanguageDialog(context);
          },
        ),
      ]),
      body: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? ListView.builder(
                itemCount: controller.categories.length,
                itemBuilder: (BuildContext context, int i) {
                  return Padding(padding: EdgeInsets.only(left: 0), child: CategoryTile(category: controller.categories[i]));
                })
            : GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 5,
                children: controller.categories.map((Category c) {
                  return Padding(padding: EdgeInsets.only(left: 40, right: 30), child: CategoryTile(category: c));
                }).toList()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => Info()),
        child: Icon(Icons.info_outline_rounded),
        backgroundColor: Colors.cyan,
      ),
    );
  }

  void _showSelectLanguageDialog(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    showDialog<dynamic>(
      context: context,
      builder: (_) => AlertDialog(
        insetPadding: isDeviceSmallerThan600dp(context) ? EdgeInsets.all(50) : EdgeInsets.all(150),
        titlePadding: EdgeInsets.only(top: 24, right: 24, left: 24),
        title: Text('categories_dialog_title'.tr,
            textAlign: TextAlign.left, style: textTheme.headline6?.copyWith(color: Colors.grey[900], fontWeight: FontWeight.bold)),
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16, right: 24, bottom: 16, left: 24),
              child: Text(
                'categories_dialog_text'.tr,
                style: textTheme.subtitle1?.copyWith(color: Colors.grey[700]),
              ),
            ),
            Divider(height: 1, thickness: 1),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 160),
                child: ListView.builder(
                    itemCount: localeController.locales.length,
                    itemBuilder: (BuildContext context, int i) {
                      return LocaleTile(locale: localeController.locales[i], updateLocale: localeController.updateLocale);
                    }),
              ),
            ),
            Divider(height: 1, thickness: 1),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text('categories_dialog_button'.tr),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
