import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/pages/info/info_page.dart';
import 'package:tutorial_inicial/app/pages/settings/settings_page.dart';

class ConverterDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SafeArea(
            child: Container(
              alignment: Alignment.centerLeft,
              height: 75,
              color: Colors.cyan,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_outlined),
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8),
          DrawerOptionItem(icon: Icons.info_outline, text: 'info_title'.tr, onTap: () => Get.to(() => InfoPage())),
          Divider(color: Colors.grey),
          DrawerOptionItem(icon: Icons.settings_outlined, text: 'settings_title'.tr, onTap: () => Get.to(() => SettingsPage())),
        ],
      ),
    );
  }
}

class DrawerOptionItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() onTap;

  const DrawerOptionItem({required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.cyan.withOpacity(0.3),
      child: ListTile(
        title: Row(
          children: [
            Icon(icon),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(text),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
