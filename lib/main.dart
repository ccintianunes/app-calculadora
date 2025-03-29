import 'package:flutter/material.dart';
import 'valores.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? x;
  int? y;
  int? resultado;

  // Função para navegar e receber um valor de InputScreen
  Future<void> _setValue(String varName) async {
    final value = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InputScreen(varName: varName),
      ),
    );

    if (value != null) {
      setState(() {
        if (varName == 'X') {
          x = value;
        } else {
          y = value;
        }
      });
    }
  }

  void _calcular() {
    if (x != null && y != null) {
      setState(() {
        resultado = x! + y!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildValueInput('X', x),
              const SizedBox(height: 10),
              _buildValueInput('Y', y),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcular,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  backgroundColor: Colors.blueAccent,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Calcular'),
              ),
              const SizedBox(height: 20),
              Text(
                'Resultado: ${resultado ?? "Esperando..."}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildValueInput(String varName, int? value) {
    return Column(
      children: [
        Text(
          '$varName: ${value ?? 0}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () => _setValue(varName),
          child: Text('Informar $varName'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 40),
            backgroundColor: Colors.grey[700],
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
