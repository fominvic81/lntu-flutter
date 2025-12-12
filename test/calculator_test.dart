import 'package:flutter_test/flutter_test.dart';
import 'package:lntu_flutter/calculator.dart';

void main() {
  group("Test calculator", () {
    var calculator = Calculator();
    test("Test x = 0", () {
      expect(calculator.Calculate(0), 16);
    });
    test("Test x = 2", () {
      expect(calculator.Calculate(2), 22);
    });
    test("Test x = 3", () {
      expect(calculator.Calculate(3), 40);
    });
  });
}
