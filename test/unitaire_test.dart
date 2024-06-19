import 'package:app_test/main.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('Calcul de la moyenne des étudiants', () {
    final etudiants = [
      Etudiant(nom: 'Alice', moyenne: 17.25),
      Etudiant(nom: 'Bob', moyenne: 16.5),
      Etudiant(nom: 'Charlie', moyenne: 11.75),
    ];
    double calculateMoyenne(List<Etudiant> etudiants) {
      double total = 0.0;
      for (var etudiant in etudiants) {
        total += etudiant.moyenne;
      }
      return total / etudiants.length;
    }

    final moyenne = calculateMoyenne(etudiants);
    expect(moyenne, closeTo(15.1667, 0.0001));
  });
}
