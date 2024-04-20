import 'dart:math';

import 'operacion.dart';

class Potencia extends Operacion {
  Potencia(double operando1, double operando2) : super(operando1, operando2);

  @override
  double calcular() {
    return pow(operando1, operando2).toDouble();
  }
}