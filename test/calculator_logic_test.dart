import 'package:flutter_test/flutter_test.dart';
import 'package:app_movil_calculator/src/logic/calculator_logic.dart';

void main() {
  group('Calculator Logic', () {
    late CalculatorLogic calculator;

    setUp(() {
      calculator = CalculatorLogic();
    });

    test('Initial display value is 0', () {
      expect(calculator.getCurrentInput(), '0');
    });

    test('Input numbers updates display', () {
      calculator.input('5');
      expect(calculator.getCurrentInput(), '5');

      calculator.input('3');
      expect(calculator.getCurrentInput(), '53');
    });

    test('Addition operation works correctly', () {
      calculator.input('5');
      calculator.input('+');
      calculator.input('3');
      calculator.calculate();

      expect(calculator.getCurrentInput(), '8');
    });

    test('Subtraction operation works correctly', () {
      calculator.input('9');
      calculator.input('-');
      calculator.input('4');
      calculator.calculate();

      expect(calculator.getCurrentInput(), '5');
    });

    test('Multiplication operation works correctly', () {
      calculator.input('3');
      calculator.input('*');
      calculator.input('7');
      calculator.calculate();

      expect(calculator.getCurrentInput(), '21');
    });

    test('Division operation works correctly', () {
      calculator.input('8');
      calculator.input('/');
      calculator.input('2');
      calculator.calculate();

      expect(calculator.getCurrentInput(), '4');
    });

    test('Division by zero returns Error', () {
      calculator.input('8');
      calculator.input('/');
      calculator.input('0');
      calculator.calculate();

      expect(calculator.getCurrentInput(), 'Error');
    });

    test('Clear resets calculator', () {
      calculator.input('9');
      calculator.input('+');
      calculator.input('2');
      calculator.clear();

      expect(calculator.getCurrentInput(), '0');
    });
  });
}
