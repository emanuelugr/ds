import 'package:flutter/material.dart';
import 'operaciones/operaciones.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Calculadora(title: 'Calculadora'),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key, required this.title});

  final String title;

  @override
  State<Calculadora> createState() => _Calculadora();
}

class _Calculadora extends State<Calculadora> {
  Operacion? op;

  double operando1 = 0;
  double operando2 = 0;
  String dropdownValue = '+';
  double res = 0;

  void _calcular() {
    if (op != null) {
      setState(() {
        res = op!.calcular();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              TextField(
                controller:TextEditingController(text: operando1.toStringAsFixed(2)),
                onChanged: (value) {
                  operando1 = double.tryParse(value) ??
                      0; // Convertir el valor del primer operando a double
                },
                decoration: const InputDecoration( //const - sugerencias de intelisence para mejorar rendimiento
                  labelText: 'Primer número',
                ),
              ),
              TextField(
                controller:TextEditingController(text: operando2.toStringAsFixed(2)),
                onChanged: (value) {
                  operando2 = double.tryParse(value) ??
                      0; // Convertir el valor del segundo operando a double
                },
                decoration: const InputDecoration(
                  labelText: 'Segundo número',
                ),
              ),
              DropdownButton<String>( //Tuve problemas con esto. Dropdown vuelve a pintar los widgets puesto que se llama setState() 
                                      // De forma que utilizao operando1 y operando2 para guardar los valores de estado
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;

                  }); //fin set State
                },
                items: <String>['+', '-', '*', '/', '^']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
            ),
            ElevatedButton(
              onPressed:(){
                 switch (dropdownValue) {
                      case '+':
                        op = new Suma(operando1, operando2);
                        break;
                      case '-':
                        op = Resta(operando1, operando2);
                        break;
                      case '*':
                        op = Producto(operando1, operando2);
                        break;
                      case '/':
                        op = Division(operando1, operando2);
                        break;
                      case '^':
                        op = Potencia(operando1, operando2);
                        break;
                      default:
                        throw Exception('Operación no válida');
                    }
                    _calcular();
              },
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            
            Visibility(
              child: Text(
                'Resultado: bla bla: ${res.toStringAsFixed(2)}', // Mostrar el resultado con dos decimales solo si res no es nulo
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
