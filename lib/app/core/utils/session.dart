import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tutorial_inicial/app/utils/locale.dart';

final _secureStorage = FlutterSecureStorage();

const _currentLocaleKey = 'current_locale';

Future<void> writeCurrentLocale(Locale locale) async {
  return await _secureStorage.write(key: _currentLocaleKey, value: locale.toString());
}

Future<Locale?> readCurrentLocale() async {
  final currentLocaleString = await _secureStorage.read(key: _currentLocaleKey);

  return parseLocale(currentLocaleString);
}
