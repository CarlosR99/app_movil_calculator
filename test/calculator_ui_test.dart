import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_movil_calculator/src/screens/calculator_ui.dart';

void main() {
  testWidgets('Calculator display shows input', (WidgetTester tester) async {
    // Build the calculator UI
    await tester.pumpWidget(const MaterialApp(home: CalculatorUI()));

    // Buscar el botón "7" y hacer tap
    final button7 = find.widgetWithText(ElevatedButton, '7');
    expect(button7, findsOneWidget);
    await tester.tap(button7);

    // Buscar la pantalla y verificar que muestre "7"
    final display = find.text('7');
    expect(display, findsOneWidget);
  });

  testWidgets('Addition operation updates display',
      (WidgetTester tester) async {
    // Build the calculator UI
    await tester.pumpWidget(const MaterialApp(home: CalculatorUI()));

    // Input '4 + 2 ='
    await tester.tap(find.byKey(const Key('button_4')));
    await tester.tap(find.byKey(const Key('button_+')));
    await tester.tap(find.byKey(const Key('button_2')));
    await tester.tap(find.byKey(const Key('button_=')));
    await tester.pump();

    // Verify display shows '6'
    expect(find.text('6'), findsOneWidget);
  });

  testWidgets('Clear button resets the display', (WidgetTester tester) async {
    // Build the calculator UI
    await tester.pumpWidget(const MaterialApp(home: CalculatorUI()));

    // Input '5', then clear
    await tester.tap(find.widgetWithText(ElevatedButton, '5'));
    await tester.pump();
    await tester.tap(find.widgetWithText(ElevatedButton, 'C'));
    await tester.pump();

    // Verify display is reset to '0'
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Division by zero shows Error', (WidgetTester tester) async {
    // Build the calculator UI
    await tester.pumpWidget(const MaterialApp(home: CalculatorUI()));

    // Input '8 / 0 ='
    await tester.tap(find.widgetWithText(ElevatedButton, '8'));
    await tester.tap(find.widgetWithText(ElevatedButton, '/'));
    await tester.tap(find.widgetWithText(ElevatedButton, '0'));
    await tester.tap(find.widgetWithText(ElevatedButton, '='));
    await tester.pump();

    // Verify display shows 'Error'
    expect(find.text('Error'), findsOneWidget);
  });
}
