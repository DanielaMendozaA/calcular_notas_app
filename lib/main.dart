import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de notas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xE767F1EC)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calcula tus notas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _materia = TextEditingController();
  final _nota1 = TextEditingController();
  final _nota2 = TextEditingController();
  final _nota3 = TextEditingController();
  final _nota4 = TextEditingController();
  double _notaFinal = 0;
  String _mensaje = "";

  void _calcularNotas() {
    setState(() {
      _notaFinal = (double.parse(_nota1.text) + double.parse(_nota2.text) +
          double.parse(_nota3.text) + double.parse(_nota4.text)) / 4;
      if (_notaFinal < 3.0) {
        _mensaje = "Usted reprobó ${_materia.text}";
      } else {
        _mensaje = "Usted aprobó ${_materia.text}";
        }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        //Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding (
        padding: const EdgeInsets.symmetric(horizontal:5 , vertical:5 ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _materia,
              keyboardType: TextInputType.text,
              style: const TextStyle (fontSize: 20),
              decoration:  InputDecoration (
                contentPadding: const EdgeInsets.symmetric(vertical:8, horizontal:8),
                labelText: "Ingrese la materia",
                prefixIcon: const Icon (Icons.book_online_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _nota1,
              keyboardType: TextInputType.number,
              style: const TextStyle (fontSize: 20),
              decoration:  InputDecoration (
                contentPadding: const EdgeInsets.symmetric(vertical:3, horizontal:3),
                labelText: "Ingrese la nota #1",
                prefixIcon: const Icon (Icons.numbers),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _nota2,
              keyboardType: TextInputType.number,
              style: const TextStyle (fontSize: 20),
              decoration:  InputDecoration (
                contentPadding: const EdgeInsets.symmetric(vertical:3, horizontal:3),
                labelText: "Ingrese la nota #2",
                prefixIcon: const Icon (Icons.numbers),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _nota3,
              keyboardType: TextInputType.number,
              style: const TextStyle (fontSize: 20),
              decoration:  InputDecoration (
                contentPadding: const EdgeInsets.symmetric(vertical:3, horizontal:3),
                labelText: "Ingrese la nota #3",
                prefixIcon: const Icon (Icons.numbers),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _nota4,
              keyboardType: TextInputType.number,
              style: const TextStyle (fontSize: 20),
              decoration:  InputDecoration (
                contentPadding: const EdgeInsets.symmetric(vertical:3, horizontal:3),
                labelText: "Ingrese la nota #4",
                prefixIcon: const Icon (Icons.numbers),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                _calcularNotas();
              },
              label: const Text ("Calcular"),
              icon: const Icon (Icons.add_circle, size: 18, color: Colors.yellow),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Su nota final es: $_notaFinal',
              style: const TextStyle (fontSize: 20, fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '$_mensaje',
              style: const TextStyle (fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
