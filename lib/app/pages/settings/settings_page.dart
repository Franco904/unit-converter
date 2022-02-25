import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/core/controllers/locale_controller.dart';
import 'package:tutorial_inicial/app/modules/category_list/local_widgets/locale_tile.dart';
import 'package:tutorial_inicial/app/core/utils/device.dart';

class SettingsPage extends StatelessWidget {
  final LocaleController localeController = Get.find<LocaleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings_title'.tr),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SafeArea(child: SizedBox(height: 24)),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'settings_label1'.tr,
              style: TextStyle(fontSize: 14, letterSpacing: 2, color: Colors.grey[800]),
            ),
          ),
          SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.language_rounded),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('settings_language_dialog_title'.tr),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: OutlinedButton(
                      onPressed: () => _showSelectLanguageDialog(),
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(BorderSide(color: Colors.cyan)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
                      ),
                      child: InkWell(
                        splashColor: Colors.cyan.withOpacity(0.3),
                        child: Text(
                          localeController.getLocaleName(),
                          style: TextStyle(color: Colors.cyan),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSelectLanguageDialog() {
    final context = Get.context!;
    final textTheme = Theme.of(context).textTheme;

    showDialog<dynamic>(
      context: context,
      builder: (_) => AlertDialog(
        insetPadding: isDeviceSmallerThan600dp(context) ? EdgeInsets.all(50) : EdgeInsets.all(150),
        titlePadding: EdgeInsets.only(top: 24, right: 24, left: 24),
        title: Text('settings_language_dialog_title'.tr,
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
                'settings_language_dialog_text'.tr,
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
                        itemBuilder: (_, i) {
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
            child: Text('settings_language_dialog_button'.tr),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
