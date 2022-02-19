import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/core/controllers/locale_controller.dart';
import 'package:tutorial_inicial/app/modules/category_list/category_list_controller.dart';
import 'package:tutorial_inicial/app/modules/category_list/local_widgets/category_tile.dart';
import 'package:tutorial_inicial/app/modules/category_list/local_widgets/locale_tile.dart';
import 'package:tutorial_inicial/app/pages/info/info_page.dart';
import 'package:tutorial_inicial/app/utils/device.dart';

class CategoryListPage extends GetView<CategoryListController> {
  final LocaleController localeController = Get.find<LocaleController>();

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<CategoryListController>()) {
      Get.delete<CategoryListController>();
    }
    Get.put(CategoryListController());

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
      body: ListView.builder(
          itemCount: controller.categories.length,
          itemBuilder: (BuildContext context, int i) {
            return Padding(padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12), child: CategoryTile(category: controller.categories[i]));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => InfoPage()),
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
                  constraints: BoxConstraints(maxHeight: 165),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ListView.builder(
                        itemCount: localeController.locales.length,
                        itemBuilder: (BuildContext context, int i) {
                          return LocaleTile(locale: localeController.locales[i], updateLocale: localeController.updateLocale);
                        }),
                  )),
            ),
            Divider(height: 1, thickness: 1),
          ],
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(primary: Colors.cyan, textStyle: textTheme.button?.copyWith(fontSize: 18)),
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
