import 'operacion.dart';

class Producto extends Operacion{
  Producto(super.operando1,super.operando2);

  @override
  double calcular(){
    return operando1*operando2;
  }
}
