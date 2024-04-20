import 'operacion.dart';

class Suma extends Operacion {
  Suma(super.operando1, super.operando2);

  @override
  double calcular() {
    return operando1 + operando2;
  }
}