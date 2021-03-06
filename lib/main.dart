import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';
import 'package:tutorial_inicial/app/core/services/locale_service.dart';
import 'package:tutorial_inicial/app/core/utils/global_bindings.dart';
import 'package:tutorial_inicial/app/core/utils/translations.dart';
import 'package:tutorial_inicial/app/routes/pages.dart';
import 'package:tutorial_inicial/app/routes/routes.dart';
import 'package:tutorial_inicial/app/core/utils/device.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadDeviceOrientation();
  await initialConfig().then((_) => runApp(DevicePreview(enabled: !kReleaseMode, builder: (_) => UnitConverterApp())));
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
      initialRoute: Routes.SPLASH,
      initialBinding: GlobalBindings(),
      getPages: getAppPages(),
      builder: DevicePreview.appBuilder,
      locale: localeStorage.currentLocale,
      translations: UnitConverterTranslations(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
      ),
    );
  }
}
