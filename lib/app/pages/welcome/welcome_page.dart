import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/core/utils/session.dart';
import 'package:tutorial_inicial/app/routes/routes.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 64),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'app_title'.tr,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.cyan),
                ),
              ),
              const SizedBox(height: 36),
              Flexible(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 225, maxHeight: 300),
                  child: Image.asset('./lib/assets/images/welcome_image.png'),
                ),
              ),
              const SizedBox(height: 36),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'welcome_label'.tr,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () async {
                    Get.offNamed(Routes.CATEGORY);
                    await writeFirstAccess(false);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.cyan[600], textStyle: const TextStyle(fontSize: 18)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    child: Text(
                      'welcome_button'.tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
