// Importa el paquete de Flutter para construir la interfaz de usuario.
import 'package:flutter/material.dart';
// Importa los widgets personalizados para los botones y
//la pantalla de la calculadora.
import '../widgets/buttons.dart';
import '../widgets/display.dart';
// Importa la lógica de la calculadora.
import '../logic/calculator_logic.dart';

/// Clase que representa la interfaz de usuario de la calculadora.
class CalculatorUI extends StatefulWidget {
  // Constructor de la clase, utiliza super.key para la clave de widget.
  const CalculatorUI({super.key});

  @override
  CalculatorUIState createState() =>
      CalculatorUIState(); // Crea el estado de la calculadora.
}

/// Estado asociado a la clase CalculatorUI.
class CalculatorUIState extends State<CalculatorUI> {
  final CalculatorLogic _calculatorLogic =
      CalculatorLogic(); // Instancia de la lógica de la calculadora.

  /// Maneja la pulsación de botones.
  ///
  /// Dependiendo del valor del botón presionado, se ejecuta la lógica
  /// correspondiente (limpiar, calcular o ingresar un valor).
  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _calculatorLogic.clear(); // Limpia la calculadora.
      } else if (value == '=') {
        _calculatorLogic.calculate(); // Calcula el resultado final.
      } else {
        _calculatorLogic
            .input(value); // Ingresa el valor en la lógica de la calculadora.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Construye la interfaz de usuario.
    return Scaffold(
      appBar: AppBar(
          // Barra de navegación superior.
          title: const Text('Calculadora')),
      body: Column(
        children: [
          // Widget de visualización que muestra la entrada actual.
          Display(displayText: _calculatorLogic.getCurrentInput()),
          Expanded(
            // Widget de botones que maneja la entrada del usuario.
            child: Buttons(onButtonPressed: _onButtonPressed),
          ),
        ],
      ),
    );
  }
}
