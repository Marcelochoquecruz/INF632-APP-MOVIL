import 'package:flutter/material.dart';
import 'dart:math'; // Para generar números aleatorios

void main() {
  runApp(const CachoApp());
}

class CachoApp extends StatelessWidget {
  const CachoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CachoScreen(),
    );
  }
}

class CachoScreen extends StatefulWidget {
  const CachoScreen({super.key});

  @override
  State<CachoScreen> createState() => _CachoState();
}

class _CachoState extends State<CachoScreen> {
  int balasCount = 0;
  int boton2Count = 0;
  int tontosCount = 0;
  int tricasCount = 0;
  int cuadrasCount = 0;
  int quinasCount = 0;
  int cenasCount = 0;
  int fullCount = 0;
  int pokerCount = 0;

  // Variables para los dados
  List<int> diceValues = List<int>.filled(5, 1);

  // Función para generar valores aleatorios entre 1 y 6 para cada dado
  void lanzarDados() {
    setState(() {
      for (int i = 0; i < 5; i++) {
        diceValues[i] = Random().nextInt(6) + 1;
      }
    });
  }

  void balas() {
    setState(() {
      balasCount = (balasCount < 5) ? balasCount + 1 : 0;
    });
  }

  void boton2Pressed() {
    setState(() {
      boton2Count = (boton2Count == 0)
          ? 20
          : (boton2Count == 20)
              ? 25
              : 0;
    });
  }

  void tontosPressed() {
    setState(() {
      tontosCount = (tontosCount < 10) ? tontosCount + 2 : 0;
    });
  }

  void tricasPressed() {
    setState(() {
      tricasCount = (tricasCount < 15) ? tricasCount + 3 : 0;
    });
  }

  void cuadrasPressed() {
    setState(() {
      cuadrasCount = (cuadrasCount < 20) ? cuadrasCount + 4 : 0;
    });
  }

  void quinasPressed() {
    setState(() {
      quinasCount = (quinasCount < 25) ? quinasCount + 5 : 0;
    });
  }

  void cenasPressed() {
    setState(() {
      cenasCount = (cenasCount < 30) ? cenasCount + 6 : 0;
    });
  }

  void fullPressed() {
    setState(() {
      fullCount = (fullCount == 0)
          ? 30
          : (fullCount == 30)
              ? 35
              : 0;
    });
  }

  void pokerPressed() {
    setState(() {
      pokerCount = (pokerCount == 0)
          ? 40
          : (pokerCount == 40)
              ? 45
              : 0;
    });
  }

  void registrarPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRACTICA 1 INF-632 Univ. Marcelo Choque Cruz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botones de dados en una fila
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DadoButton(
                    value: diceValues[index],
                  )
                );
              }),
            ),

            // Botón para lanzar los dados
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: lanzarDados,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(150, 60),
                ),
                child: const Text(
                  'Lanzar Dados',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Primera fila de botones para registrar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                botonAccionConIcono(
                  'Balas: $balasCount',
                  balas,
                  Icons.local_fire_department,
                  Colors.red,
                ),
                botonAccionConIcono('Escalera: $boton2Count', boton2Pressed,
                    Icons.trending_up, Colors.green),
                botonAccionConIcono('Cuadras: $cuadrasCount', cuadrasPressed,
                    Icons.square_foot, Colors.blue),
              ],
            ),

            // Segunda fila de botones para registrar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                botonAccionConIcono('Tontos: $tontosCount', tontosPressed,
                    Icons.mood_bad, Colors.orange),
                botonAccionConIcono('FULL: $fullCount', fullPressed,
                    Icons.fullscreen, Colors.purple),
                botonAccionConIcono('Quinas: $quinasCount', quinasPressed,
                    Icons.looks_5, Colors.cyan),
              ],
            ),

            // Tercera fila de botones para registrar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                botonAccionConIcono('Tricas: $tricasCount', tricasPressed,
                    Icons.looks_3, Colors.yellow),
                botonAccionConIcono('POKER: $pokerCount', pokerPressed,
                    Icons.casino, Colors.teal),
                botonAccionConIcono('Cenas: $cenasCount', cenasPressed,
                    Icons.dinner_dining, Colors.brown),
              ],
            ),

            // Botón de REGISTRAR
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: registrarPressed,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(150, 60),
                ),
                child: const Text(
                  'REGISTRAR',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para el botón de dado
  Widget DadoButton({required int value}) {
    Color textColor = value == 1 ? Colors.red : Colors.black;

    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.blue, width: 2),
        ),
        minimumSize: const Size(60, 60),
      ),
      child: Text(
        '$value',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: textColor, // Cambia el color según el valor
        ),
      ),
    );
  }

  // Para refrescar los iconos y colores y texto de los botones 
  Widget botonAccionConIcono(
      String texto, Function() onPressed, IconData icono, Color colorIcono,
      {Color backgroundColor = Colors.white}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icono, color: colorIcono, size: 24),
        label: Text(
          texto,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Texto en negro
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          backgroundColor: backgroundColor, // Color de fondo variable
          foregroundColor: Colors.blue[800], // Texto azul oscuro
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Bordes redondeados
            side: const BorderSide(color: Colors.blue, width: 2), // Borde azul
          ),
          minimumSize: const Size(180, 60),
        ),
      ),
    );
  }
}
