// # Redirecting constructors
// ref: https://dart.dev/language/constructors

import 'package:test/test.dart';

class Person {
  Person({required this.fatherName, required this.motherName});
  final String? fatherName;
  final String? motherName;

  Person.withoutMother(String fatherName)
      : this(fatherName: fatherName, motherName: null);

  Person.withoutFather(String motherName)
      : this(fatherName: null, motherName: motherName);

  Person.withoutParents() : this(fatherName: null, motherName: null);
}

void main() {
  group('Delegating the main constructor > ', () {
    test('No mother', () {
      final person = Person.withoutMother('Padre');
      expect(person.motherName, null);
    });

    test('No father', () {
      final person = Person.withoutFather('Madre');
      expect(person.fatherName, null);
    });

    test('No parents', () {
      final person = Person.withoutParents();
      expect(person.motherName, null);
      expect(person.fatherName, null);
    });
  });
}
