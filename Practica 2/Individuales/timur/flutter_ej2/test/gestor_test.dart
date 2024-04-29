import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ej2/back/GestorDeTareas.dart';
import 'package:flutter_ej2/back/Tarea.dart';

void main() {
  GestorDeTareas gestor_mock = GestorDeTareas();

  void pruebaAgregar() {
    Tarea t = Tarea("Comprar pan");
    gestor_mock.AgregarTarea(t);
    expect(gestor_mock.NumTareas(), 1);
  }

  void pruebaExceptionId() {
    expect(
        () => gestor_mock.GetTareaById(gestor_mock.NumTareas() + 1), throwsA);
  }

  void pruebaCompletada() {
    gestor_mock.MarcarCompletada(gestor_mock.NumTareas() - 1);

    expect(
        gestor_mock.GetTareaById(gestor_mock.NumTareas() - 1).completada, true);
  }

  void probarBorrar() {
    gestor_mock.BorrarTarea(gestor_mock.NumTareas() - 1);
    expect(gestor_mock.NumTareas(), 0);
  }

  test("Prueba Agregar", pruebaAgregar);
  test("Prueba Exception", pruebaExceptionId);
  test("Prueba Completar", pruebaCompletada);
  test("Prueba borrar", probarBorrar);
}
