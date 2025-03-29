import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  final String varName;
  const InputScreen({super.key, required this.varName});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _controller = TextEditingController();

  void _submitValue() {
    if (_controller.text.isNotEmpty) {
      Navigator.pop(context, int.tryParse(_controller.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preenche Valores')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Set ${widget.varName}:', style: const TextStyle(fontSize: 20)),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Digite um valor'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitValue,
              child: const Text('Ok'),
            ),
          ],
        ),
      ),
    );
  }
}