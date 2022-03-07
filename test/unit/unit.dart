import 'package:flutter_test/flutter_test.dart';

import 'package:tutorial_inicial/app/data/model/unit.dart';

void main() {
  group('Unit | ', () {
    final unit = Unit(id: 4, name: 'Meter', idCategory: 1);

    test('Deve criar objeto do tipo Unit', () {
      expect(unit.runtimeType, Unit);
    });

    test('Deve retornar o id da unidade', () {
      expect(unit.id, 4);
    });
    test('Deve retornar o nome da unidade', () {
      expect(unit.name, 'Meter');
    });
    test('Deve retornar o id da categoria da unidade', () {
      expect(unit.idCategory, 1);
    });

    test('Deve mostrar erro se o atributo id for negativo', () {
      expect(() => Unit(id: -40, name: 'Meter', idCategory: 1), throwsAssertionError);
    });
  });
}
