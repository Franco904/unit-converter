import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/core/services/locale_service.dart';

class LocaleController extends GetxController {
  final LocaleService localeStorage = Get.find<LocaleService>();
  final RxString currentLocale = Get.locale.toString().obs;

  final List<Map> locales = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'Español', 'locale': Locale('es', 'AR')},
    {'name': 'Português', 'locale': Locale('pt', 'BR')}
  ];

  Future<void> updateLocale(Locale locale) async {
    Future.delayed(Duration(milliseconds: 200), () {
      // Atualiza locale app
      Get.updateLocale(locale);

      // Atualiza locale variable
      currentLocale.value = Get.locale!.toString();

      // Atualiza locale storage
      localeStorage.write(Get.locale!);
    });
  }

  String getLocaleName() {
    String locale = '';

    locales.forEach((l) {
      if (l['locale'] == Get.locale) {
        locale = l['name'];
      }
    });

    return locale;
  }
}
