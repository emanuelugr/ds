import 'operacion.dart';

class Resta extends Operacion {
  Resta(double operando1, double operando2) : super(operando1, operando2);

  @override
  double calcular() {
    return operando1 - operando2;
  }
}