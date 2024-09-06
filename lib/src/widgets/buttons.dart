// Importamos el paquete de Flutter para construir la interfaz de usuario.
import 'package:flutter/material.dart';

// Clase que representa la interfaz de los botones de la calculadora.
class Buttons extends StatelessWidget {
  final Function(String)
      onButtonPressed; // Función que se llama al presionar un botón.

  // Constructor de la clase, que recibe la función onButtonPressed
  //como parámetro requerido.
  const Buttons({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    // Construye la interfaz de los botones en una columna.
    return Column(
      children: [
        Expanded(
          flex: 4, // Espacio para el GridView que contiene los botones.
          child: Padding(
            padding:
                const EdgeInsets.all(8.0), // Padding alrededor del GridView.
            child: GridView.count(
              crossAxisCount: 4, // Número de botones en cada fila.
              crossAxisSpacing: 10.0, // Espacio horizontal entre los botones.
              mainAxisSpacing: 10.0, // Espacio vertical entre los botones.
              childAspectRatio: 1.2, // Ajuste de la proporción de los botones.
              children: [
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('/',
                    color: Colors.orange,
                    textColor: Colors.white), // Botón de división.
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('*',
                    color: Colors.orange,
                    textColor: Colors.white), // Botón de multiplicación.
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('-',
                    color: Colors.orange,
                    textColor: Colors.white), // Botón de resta.
                _buildButton('.',
                    color: Colors.grey.shade700,
                    textColor: Colors.white), // Botón de punto decimal.
                _buildButton('0'),
                _buildButton('+',
                    color: Colors.orange,
                    textColor: Colors.white), // Botón de suma.
                _buildButton('C',
                    color: Colors.red,
                    textColor: Colors.white), // Botón de limpiar.
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1, // Espacio expandido para el botón "=".
          child: Padding(
            padding: const EdgeInsets.symmetric(
                // Padding horizontal.
                horizontal: 8.0),
            child: ElevatedButton(
              key: const Key('button_='),
              onPressed: () => onButtonPressed(
                  '='), // Llama a la función al presionar el botón "=".
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Color para el botón igual.
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      // Bordes redondeados.
                      Radius.circular(10)),
                ),
              ),
              child: const Text(
                '=',
                style: TextStyle(
                    // Tamaño y color del texto.
                    fontSize: 36,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Crea un botón con el valor proporcionado.
  ///
  /// Este método se encarga de construir un botón elevado
  /// con un color de fondo y un color de texto opcionales.
  Widget _buildButton(String value, {Color? color, Color? textColor}) {
    return ElevatedButton(
      key: Key('button_$value'), // Clave única para el botón.
      onPressed: () =>
          onButtonPressed(value), // Llama a la función al presionar el botón.
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.blue, // Color de fondo del botón.
        padding: const EdgeInsets.all(20), // Tamaño del botón.
        shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(10)), // Bordes redondeados.
        ),
      ),
      child: Text(
        value,
        style: TextStyle(
            // Tamaño y color del texto.
            fontSize: 20,
            color: textColor ?? Colors.white),
      ),
    );
  }
}
