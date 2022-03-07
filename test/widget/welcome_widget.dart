import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial_inicial/app/pages/welcome/welcome_page.dart';

void main() {
  group('WelcomePage Widget | ', () {
    testWidgets('Deve apresentar a imagem principal na tela de Welcome', (tester) async {
      await tester.pumpWidget(MaterialApp(home: WelcomePage()));

      final mainImage = find.byType(Image);
      expect(mainImage, findsOneWidget);
    });

    testWidgets('Deve apresentar o botão de início na tela de Welcome', (tester) async {
      await tester.pumpWidget(MaterialApp(home: WelcomePage()));

      final startButton = find.byType(ElevatedButton);
      expect(startButton, findsOneWidget);
    });
  });
}
