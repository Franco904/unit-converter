import 'package:flutter_test/flutter_test.dart';

import 'package:get/get.dart';
import 'package:tutorial_inicial/app/core/utils/validations.dart';

void main() {
  group('Converter input | ', () {
    test('Deve aceitar entradas válidas no campo', () {
      expect(validateIntText('500'), null);
      expect(validateIntText('-40'), null);
      expect(validateIntText('8790.25'), null);
      expect(validateIntText('-50.27'), null);
      expect(validateIntText('400000.375'), null);
    });

    test('Deve rejeitar valor nulo no campo', () {
      expect(validateIntText(''), 'converter_validation_required'.tr);
    });

    test('Deve rejeitar entradas inválidas no campo', () {
      expect(validateIntText('aaa'), 'converter_validation_invalid'.tr);
      expect(validateIntText('   '), 'converter_validation_invalid'.tr);
      expect(validateIntText('```90yiu```'), 'converter_validation_invalid'.tr);
      expect(validateIntText('^^tjhj/5'), 'converter_validation_invalid'.tr);
      expect(validateIntText('🎈☁'), 'converter_validation_invalid'.tr);
    });
  });

  group('Converter dropdown | ', () {
    test('Deve rejeitar valor nulo no campo', () {
      expect(validateDropdown(''), 'converter_validation_required'.tr);
    });
  });
}
