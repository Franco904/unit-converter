import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/material.dart';
import 'package:tutorial_inicial/app/data/model/category.dart';
import 'package:tutorial_inicial/app/data/model/unit.dart';

void main() {
  group('Category | ', () {
    final units = [
      Unit(id: 1, name: 'Seconds', idCategory: 1),
      Unit(id: 2, name: 'Minutes', idCategory: 1),
      Unit(id: 3, name: 'Hours', idCategory: 1)
    ];

    final category = Category(
      id: 1,
      name: 'Time',
      units: [units[0], units[1], units[2]],
      icon: Icons.bar_chart_rounded,
    );

    test('Deve criar objeto do tipo Category', () {
      expect(category.runtimeType, Category);
    });

    test('Deve retornar o id da categoria', () {
      expect(category.id, 1);
    });
    test('Deve retornar o nome da categoria', () {
      expect(category.name, 'Time');
    });
    test('Deve retornar as unidades da categoria', () {
      expect(category.units, [units[0], units[1], units[2]]);
    });
    test('Deve retornar o ícone da categoria', () {
      expect(category.icon, Icons.bar_chart_rounded);
    });

    test('Deve mostrar erro se o atributo id for negativo/inválido', () {
      expect(
        () => Category(id: -5, name: 'Length', units: [units[0], units[1], units[2]], icon: Icons.            bar_chart_rounded),
        throwsAssertionError);
    });
  });
}
