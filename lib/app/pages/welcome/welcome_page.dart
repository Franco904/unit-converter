import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/core/utils/session.dart';
import 'package:tutorial_inicial/app/modules/category_list/category_list_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 64),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'app_title'.tr,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.cyan),
                ),
              ),
              SizedBox(height: 36),
              Flexible(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 225, maxHeight: 300),
                  child: Image.asset('./lib/assets/images/welcome_image.png'),
                ),
              ),
              SizedBox(height: 36),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'welcome_label'.tr,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () async {
                    Get.off(() => CategoryListPage());
                    await writeFirstAccess(false);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.cyan[600], textStyle: TextStyle(fontSize: 18)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    child: Text(
                      'welcome_button'.tr,
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
