// Importamos el paquete de Flutter para construir la interfaz de usuario.
import 'package:flutter/material.dart';
// Importamos la UI principal de la calculadora desde el directorio src/screens.
import 'src/screens/calculator_ui.dart';

// Función principal que se ejecuta al iniciar la aplicación.
void main() {
  // Ejecuta la aplicación CalculadoraApp.
  runApp(const CalculadoraApp());
}

// Clase que representa la aplicación de la calculadora.
class CalculadoraApp extends StatelessWidget {
  // Constructor de la clase, utiliza super.key para la clave de widget.
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Construye el widget MaterialApp que sirve como
    //contenedor principal de la aplicación.
    return MaterialApp(
      // Desactiva el banner de depuración en la esquina superior derecha.
      debugShowCheckedModeBanner: false,
      // Título de la aplicación que se mostrará en la barra de título.
      title: 'Calculadora',
      // Define el tema de la aplicación, estableciendo un color primario azul.
      theme: ThemeData(primarySwatch: Colors.blue),
      // Establece la pantalla de inicio de la aplicación,
      //que es la UI de la calculadora.
      home: const CalculatorUI(),
    );
  }
}
