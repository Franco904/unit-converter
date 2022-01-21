import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  static final Locale? deviceLocale = Get.deviceLocale;
  static Locale? currentLocale;

  final List<Map> locales = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'Español', 'locale': Locale('es', 'AR')},
    {'name': 'Português', 'locale': Locale('pt', 'BR')}
  ];

  Future<void> updateLocale(Locale locale) async {
    Future.delayed(Duration(milliseconds: 200), () {
      currentLocale = locale;
      Get.updateLocale(locale);
    });
  }
}
