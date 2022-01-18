import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/core/utils/global_bindings.dart';
import 'package:tutorial_inicial/app/core/utils/translations.dart';
import 'app/routes/pages.dart';
import 'app/routes/routes.dart';

void main() {
  runApp(const UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      initialRoute: Routes.WELCOME,
      initialBinding: GlobalBindings(),
      getPages: getAppPages(),
      translations: UnitConverterTranslations(),
    );
  }
}
