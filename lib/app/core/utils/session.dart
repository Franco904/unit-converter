import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tutorial_inicial/app/core/utils/locale.dart';

final _secureStorage = FlutterSecureStorage();

const _firstAccessKey = 'first_access_key';
const _currentLocaleKey = 'current_locale';

Future<bool> checkFirstAccess() async {
  final isFirstAccess = await _secureStorage.read(key: _firstAccessKey);

  return isFirstAccess == null || isFirstAccess == 'true';
}

Future<void> writeFirstAccess(bool firstAccess) async {
  await _secureStorage.write(key: _firstAccessKey, value: firstAccess.toString());
}

Future<void> writeCurrentLocale(Locale locale) async {
  return await _secureStorage.write(key: _currentLocaleKey, value: locale.toString());
}

Future<Locale?> readCurrentLocale() async {
  final currentLocaleString = await _secureStorage.read(key: _currentLocaleKey);

  return parseLocale(currentLocaleString);
}
