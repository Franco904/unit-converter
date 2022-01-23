import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/core/services/locale_service.dart';
import 'package:tutorial_inicial/app/core/utils/global_bindings.dart';
import 'package:tutorial_inicial/app/core/utils/translations.dart';
import 'package:tutorial_inicial/app/routes/pages.dart';
import 'package:tutorial_inicial/app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialConfig().then((_) => runApp(UnitConverterApp()));
}

Future<void> initialConfig() async {
  await Get.putAsync(() => LocaleService().init());
}

class UnitConverterApp extends StatelessWidget {
  final LocaleService localeStorage = Get.find<LocaleService>();

  UnitConverterApp({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      initialRoute: Routes.WELCOME,
      initialBinding: GlobalBindings(),
      getPages: getAppPages(),
      locale: localeStorage.currentLocale,
      translations: UnitConverterTranslations(),
    );
  }
}
