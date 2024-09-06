// Clase que encapsula la lógica de cálculo para una calculadora.
class CalculatorLogic {
  double _result = 0; // Almacena el resultado de los cálculos.
  String _operator = ''; // Almacena el operador actual (suma, resta, etc.).
  String _input = ''; // Almacena la entrada actual del usuario.
  bool _isOperatorPressed = false; // Indica si se ha presionado un operador.

  // Procesa la entrada del usuario.
  //
  // Si el valor es un operador, se calcula el resultado intermedio si
  // ya hay una entrada. Si el valor es un punto, se verifica que no
  // exista otro punto en la entrada. Para otros valores, se
  // añade a la entrada actual, manejando adecuadamente la lógica
  // de operadores.
  void input(String value) {
    if (['+', '-', '*', '/'].contains(value)) {
      if (_input.isNotEmpty) {
        _calculateIntermediateResult(); // Calcula el resultado intermedio
        // si hay entrada.
      }
      _operator = value; // Establece el operador actual.
      _isOperatorPressed = true; // Indica que se ha presionado un operador.
    } else if (value == '.') {
      if (!_input.contains('.')) {
        // Solo permite un punto decimal.
        _input += value;
      }
    } else {
      if (_isOperatorPressed) {
        _input = ''; // Reinicia la entrada si se presionó un operador.
        _isOperatorPressed = false; // Reinicia el estado del operador.
      }
      _input += value; // Añade el valor a la entrada.
    }
  }

  // Retorna la entrada actual del usuario.
  //
  // Si la entrada está vacía, devuelve '0'.
  String getCurrentInput() {
    return _input.isEmpty ? '0' : _input;
  }

  // Calcula el resultado intermedio basándose en el operador
  // y la entrada actual.
  void _calculateIntermediateResult() {
    double currentInput =
        double.tryParse(_input) ?? 0; // Intenta convertir la entrada a double.

    if (_operator.isEmpty) {
      _result = currentInput; // Si no hay operador,
      // establece el resultado como la entrada.
    } else {
      // Realiza el cálculo según el operador actual.
      switch (_operator) {
        case '+':
          _result += currentInput;
          break;
        case '-':
          _result -= currentInput;
          break;
        case '*':
          _result *= currentInput;
          break;
        case '/':
          if (currentInput == 0) {
            _result = double.infinity; // Manejo de división por cero.
          } else {
            _result /= currentInput;
          }
          break;
      }
    }

    _input = _formatResult(_result); // Formatea el resultado para mostrarlo.
  }

  // Realiza el cálculo final y retorna el resultado.
  double calculate() {
    _calculateIntermediateResult(); // Calcula el resultado intermedio.
    _operator = ''; // Reinicia el operador.
    return _result; // Devuelve el resultado final.
  }

  // Formatea el resultado como un String.
  //
  // Si el valor es infinito, devuelve 'Error'. Si es un número entero,
  // se devuelve como tal; de lo contrario, se devuelve con un decimal.
  String _formatResult(double value) {
    if (value.isInfinite) {
      return 'Error'; // Manejo de división por cero y valores infinitos.
    }
    if (value == value.toInt()) {
      return value
          .toInt()
          .toString(); // Retorna como entero si no hay decimales.
    } else {
      return value.toStringAsFixed(1); // Mostrar hasta 1 decimal.
    }
  }

  // Reinicia la calculadora, restableciendo todos los valores.
  void clear() {
    _result = 0; // Reinicia el resultado a cero.
    _operator = ''; // Reinicia el operador.
    _input = ''; // Reinicia la entrada.
  }
}
