import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/core/utils/session.dart';

class LocaleService extends GetxService {
  final Locale deviceLocale = Get.deviceLocale!;
  Locale? currentLocale;

  Future<LocaleService> init() async {
    currentLocale = await readCurrentLocale() ?? deviceLocale;
    return this;
  }

  Future<void> write(Locale locale) async {
    await writeCurrentLocale(locale);
  }
}
