import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tutorial_inicial/app/data/model/category.dart';
import 'package:tutorial_inicial/app/data/model/unit.dart';
import 'package:tutorial_inicial/app/modules/category_list/local_widgets/category_tile.dart';

void main() {
  // Mock
  final category = Category(
      id: 15,
      name: 'Speed',
      units: [
        Unit(id: 67, name: 'Meters per second', idCategory: 15),
        Unit(id: 68, name: 'Kilometers per hour', idCategory: 15),
      ],
      icon: Icons.speed_rounded);

  group('CategoryTile Widget | ', () {
    testWidgets('Deve apresentar card com nome da categoria na tela', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CategoryTile(category: category)));

      final categoryCard = find.widgetWithText(Card, 'category_speed'.tr);
      expect(categoryCard, findsOneWidget);
    });

    testWidgets('Deve apresentar card com ícone da categoria na tela', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CategoryTile(category: category)));

      final categoryCard = find.widgetWithIcon(Card, Icons.speed_rounded);
      expect(categoryCard, findsOneWidget);
    });
  });
}
