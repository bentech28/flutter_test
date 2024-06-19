import 'package:app_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';




void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Application Étudiant', () {
    testWidgets('Affichage de la liste des étudiants', (WidgetTester tester) async {
      await tester.pumpWidget(MonApplication());

      expect(find.text('Liste des étudiants et de leurs moyennes :'), findsOneWidget);
      expect(find.text('Alice'), findsOneWidget);
      expect(find.text('Bob'), findsOneWidget);
    });

    testWidgets('Affichage des détails d\'un étudiant', (WidgetTester tester) async {
      await tester.pumpWidget(MonApplication());

      await tester.tap(find.text('Alice'));
      await tester.pumpAndSettle();

      expect(find.text('Nom de l\'étudiant : Alice'), findsOneWidget);
      expect(find.text('Moyenne : 17.25'), findsOneWidget);

      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
    });

    testWidgets('Calcul et affichage de la moyenne de la classe', (WidgetTester tester) async {
      await tester.pumpWidget(MonApplication());

      await tester.tap(find.text('Calculer la moyenne de la classe'));
      await tester.pumpAndSettle();

      expect(find.text('La moyenne des étudiants est : 14.75'), findsOneWidget);

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
    });
  });
}
