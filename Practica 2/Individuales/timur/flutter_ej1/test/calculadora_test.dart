import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ej1/operaciones/operaciones.dart';

void main() {
  double a_mock = 5;
  double b_mock = 0;

  double suma_mock = a_mock + b_mock;
  double resta_mock = a_mock - b_mock;
  double prod_mock = a_mock * b_mock;

  void pruebaSuma() {
    Operacion op = Suma(a_mock, b_mock);
    expect(op.operando1, a_mock);
    expect(op.operando2, b_mock);
    expect(suma_mock, op.calcular());
  }

  void pruebaResta() {
    Operacion op = Resta(a_mock, b_mock);
    expect(op.operando1, a_mock);
    expect(op.operando2, b_mock);
    expect(resta_mock, op.calcular());
  }

  void pruebaProd() {
    Operacion op = Producto(a_mock, b_mock);
    expect(prod_mock, op.calcular());
  }

  void pruebaDiv() {
    Operacion op = Division(a_mock, b_mock);
    expect(op.operando1, a_mock);
    expect(op.operando2, b_mock);
    expect(op.calcular, throwsArgumentError);
  }

  test("Prueba Suma", pruebaSuma);
  test("Prueba Resta", pruebaResta);
  test("Prueba Producto", pruebaProd);
  test("Prueba Division", pruebaDiv);
}
