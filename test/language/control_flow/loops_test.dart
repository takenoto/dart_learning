// # Loops
// ref: https://dart.dev/language/loops

import 'package:test/test.dart';

class Candidate {
  final String name;
  final String surname;
  final double yearsOfExperience;
  dynamic stuff;

  Candidate(
      {required this.name,
      required this.surname,
      required this.yearsOfExperience,
      required this.stuff});
}

void main() {
  group('For loop > ', () {
    final isabel = Candidate(
        name: 'Isabel',
        surname: 'Fernandez',
        yearsOfExperience: 3,
        stuff: {'cats': 3});
    final diego = Candidate(
        name: 'Diego',
        surname: 'Coutinho',
        yearsOfExperience: 2,
        stuff: {'dogs': 1});

    final candidates = [isabel, diego];

    group('Use a pattern to get the values from the iterable > ', () {
      late List names, yearsXP;

      setUp(() {
        names = [];
        yearsXP = [];
      });

      test('Same-name variables', () {
        for (var Candidate(:name, :yearsOfExperience) in candidates) {
          names.add(name);
          yearsXP.add(yearsOfExperience);
        }
        expect(names, ['Isabel', 'Diego']);
        expect(yearsXP, [3, 2]);
      });

      test('Diff-name variables', () {
        for (var Candidate(name: candidateName, yearsOfExperience: xp)
            in candidates) {
          names.add(candidateName);
          yearsXP.add(xp);
        }
        expect(names, ['Isabel', 'Diego']);
        expect(yearsXP, [3, 2]);
      });
    });
  });
}
