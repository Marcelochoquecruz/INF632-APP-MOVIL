import 'package:flutter/material.dart';
import 'dart:math'; // Para generar números aleatorios.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cacho Alalay - Lanzar Dados',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DiceRollerPage(),
    );
  }
}

class DiceRollerPage extends StatefulWidget {
  const DiceRollerPage({super.key});

  @override
  State<DiceRollerPage> createState() => _DiceRollerPageState();
}

class _DiceRollerPageState extends State<DiceRollerPage> {
  // Lista de cinco dados, inicializados con el valor 1.
  List<int> diceValues = List.generate(5, (_) => 1);

  // Función para lanzar los dados.
  void rollDice() {
    setState(() {
      // Generar un número aleatorio entre 1 y 6 para cada dado.
      diceValues = List.generate(5, (_) => Random().nextInt(6) + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lanzar Dados - Cacho Alalay'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Mostrar los valores de los cinco dados como cajas de texto.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: diceValues.map((value) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      value.toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Botón para lanzar los dados.
            ElevatedButton(
              onPressed: rollDice,
              child: const Text('Lanzar Dados'),
            ),
          ],
        ),
      ),
    );
  }
}
