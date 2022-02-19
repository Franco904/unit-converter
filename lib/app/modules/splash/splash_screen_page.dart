import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/modules/splash/splash_screen_controller.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Obx(() => controller.isLoading.value ? CircularProgressIndicator(color: Colors.cyan) : Container()),
    ));
  }
}
