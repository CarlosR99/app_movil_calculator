// Importamos el paquete de Flutter para construir la interfaz de usuario.
import 'package:flutter/material.dart';

// Clase que representa el área de visualización de la calculadora.
class Display extends StatelessWidget {
  final String displayText; // Texto que se muestra en la pantalla.

  // Constructor de la clase,
  //que recibe el texto a mostrar como parámetro requerido.
  const Display({super.key, required this.displayText});

  @override
  Widget build(BuildContext context) {
    // Construye el contenedor que muestra el texto.
    return Container(
      padding: const EdgeInsets.all(16), // Espaciado interno del contenedor.
      alignment: Alignment.centerRight, // Alinea el texto a la derecha.
      color: Colors.black, // Color de fondo del contenedor.
      child: Text(
        displayText, // Muestra el texto proporcionado.
        style: const TextStyle(
          fontSize: 48, // Tamaño de la fuente.
          color: Colors.white, // Color del texto.
        ),
      ),
    );
  }
}
