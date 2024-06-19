import 'package:app_test/main.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/material.dart';

void main() {
  testWidgets('Affichage de la liste des étudiants', (WidgetTester tester) async {
    await tester.pumpWidget(MonApplication());

    expect(find.text('Liste des étudiants et de leurs moyennes :'), findsOneWidget);
    expect(find.text('Alice'), findsOneWidget);
    expect(find.text('Bob'), findsOneWidget);
  });

  testWidgets('Affichage de la moyenne des étudiants', (WidgetTester tester) async {
    await tester.pumpWidget(MonApplication());

    await tester.tap(find.text('Calculer la moyenne de la classe'));
    await tester.pump();

    expect(find.text('La moyenne des étudiants est : 14.35'), findsOneWidget);
  });
}
