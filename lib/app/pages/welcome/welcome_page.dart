import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/modules/category_list/category_list_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 70),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'welcome_title'.tr,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'app_title'.tr,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.cyan),
                ),
              ),
              SizedBox(height: 32),
              SizedBox(height: 300, width: 300),
              SizedBox(height: 32),
              ElevatedButton(
                  onPressed: () => Get.off(() => CategoryListPage()),
                  style: ElevatedButton.styleFrom(primary: Colors.cyan[600], textStyle: TextStyle(fontSize: 18)),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, right: 30, bottom: 10, left: 30),
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
