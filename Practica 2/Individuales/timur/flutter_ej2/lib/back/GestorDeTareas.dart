import 'package:flutter_ej2/back/Tarea.dart';

class GestorDeTareas {
  List<Tarea> _tareas;

  GestorDeTareas() : _tareas = [] {
    //_tareas.add(Tarea("Desayunar"));
    //_tareas.add(Tarea("Tomar las pastillas de alergia"));
    //_tareas.add(Tarea("Terminar la practica de DSD"));
  }

  void AgregarTarea(Tarea t) {
    _tareas.add(t);
  }

  void BorrarTarea(int id) {
    if (id >= 0 && id < _tareas.length) {
      _tareas.removeAt(id);
    } else {
      print('ID de tarea no válido');
    }
  }

  Tarea GetTareaById(int id) {
    if (id >= 0 && id < _tareas.length) {
      return _tareas[id];
    }
    throw "Id incorrecto";
  }

  int NumTareas() {
    return _tareas.length;
  }

  void MarcarCompletada(int id) {
    if (id >= 0 && id < _tareas.length) {
      _tareas[id].completada = true;
    } else {
      print('ID de tarea no válido');
    }
  }
}
