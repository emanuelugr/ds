import 'operacion.dart';

class Division extends Operacion{
  Division(super.operando1,super.operando2);

  @override
  double calcular(){
 if (operando2 != 0) {
      return operando1 / operando2;
    } else {
      throw ArgumentError('No se puede dividir por cero');
    }
  }
}
