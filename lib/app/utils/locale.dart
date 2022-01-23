import 'package:flutter/material.dart';

Locale? parseLocale(String? localeString) {
  if (localeString == null) {
    return null;
  }
  var localeList = localeString.split('_').toList();

  return Locale(localeList[0], localeList[1]);
}
