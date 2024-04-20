import 'package:flutter/material.dart';
import 'back/GestorDeTareas.dart';
import 'back/Tarea.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GestorTareas(title: 'Gestor de Tareas'),
    );
  }
}

class GestorTareas extends StatefulWidget {
  const GestorTareas({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GestorTareas> createState() => _GestorTareasState();
}

class _GestorTareasState extends State<GestorTareas> {
  GestorDeTareas _gestorDeTareas = GestorDeTareas();
  TextEditingController _descripcionController = TextEditingController();


  void _AgregarTarea() {
    setState(() {
      String descripcion = _descripcionController.text;
      if(descripcion.isNotEmpty){
        Tarea t = Tarea(descripcion);
        _gestorDeTareas.AgregarTarea(t);
        _descripcionController.clear();
        setState(() {});
      }
    });
  }

  void _BorrarTarea(int id) {
    _gestorDeTareas.BorrarTarea(id);
    setState(() {});
  }

  void _MarcarCompletada(int id) {
    _gestorDeTareas.MarcarCompletada(id);
    setState(() {});
  }

  Widget _buildListaTareas() {
    return ListView.builder(
      itemCount: _gestorDeTareas.NumTareas(),
      itemBuilder: (context, index) {
        final tarea = _gestorDeTareas.GetTareaById(index);
        return ListTile(
          title: Text(tarea.descripcion),
          leading: Checkbox(
            value: tarea.completada,
            onChanged: (_) => _MarcarCompletada(index),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _BorrarTarea(index),
          ),
          tileColor: tarea.completada ? Colors.grey.withOpacity(0.3) : null,
        );
      },
    );
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          TextField(
            controller: _descripcionController,
            decoration: const InputDecoration(
              labelText: 'Descripción de la Tarea',
            ),
          ),
          ElevatedButton(
            onPressed: _AgregarTarea,
            child: const Text('Agregar Tarea'),
          ),
          Expanded(
            child: _buildListaTareas(),
          ),
        ],
      ),
    );
  }
}