import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  // final RxString currentLocale = ''.obs;

  final List<Map> locales = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'Español', 'locale': Locale('es', 'AR')},
    {'name': 'Português', 'locale': Locale('pt', 'BR')}
  ];
}
