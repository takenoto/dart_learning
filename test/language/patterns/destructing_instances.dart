// @ 2023-07-28
// Learning about # Destructuring class instances
// ref: https://dart.dev/language/patterns#destructuring-class-instances

import 'package:test/test.dart';

class Point {
  Point(this.x, this.y);
  final double x;
  final double y;
}

void main() {
  group('Testing point attribution', () {
    late Point point12;

    setUp(() {
      // Creates a point with x=1 and y=2
      point12 = Point(1, 2);
    });

    // The properties can be exposed as new variables

    // If the name of the new variables is identical to existing properties,
    // there is no need to repeat yourself:
    test('Same name attribution', () {
      var Point(:x, :y) = point12;
      var newX = x;
      var newY = y;
      expect((newX, newY), (point12.x, point12.y));
      // print('newX = $newX, newY = $newY');
      // newX = 1, newY = 2
    });

    test('Variable renaming', () {
      // The variables can be renamed as something else
      var Point(x: newX, y: newY) = point12;
      expect((newX, newY), (point12.x, point12.y));
      // print('newX = $newX, newY = $newY');
      // newX = 1, newY = 2
    });

    test('Using only X and setting Y', () {
      // You can attribute only the desired variables
      var newY = 0;
      var Point(x: newX) = point12;
      expect((newX, newY), (point12.x, 0));
      // print('newX = $newX, newY = $newY');
      // newX = 1, newY = 0
    });
  });
}
