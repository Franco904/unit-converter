import 'dart:convert';

import 'package:get/get.dart';
import 'package:tutorial_inicial/app/category/category_route.dart';
import 'package:tutorial_inicial/app/conversion/unit_converter.dart';
import 'package:tutorial_inicial/app/info/info.dart';
import 'package:tutorial_inicial/app/routes/routes.dart';
import 'package:tutorial_inicial/app/welcome/welcome.dart';

List<GetPage> getAppPages() {
  return [
    GetPage<void>(name: Routes.WELCOME, page: () => Welcome()),
    GetPage<void>(name: Routes.CATEGORY, page: () => CategoryRoute()),
    // GetPage<void>(name: Routes.CONVERTER, page: () => UnitConverter()),
    GetPage<void>(name: Routes.INFO, page: () => Info()),  
  ];
}