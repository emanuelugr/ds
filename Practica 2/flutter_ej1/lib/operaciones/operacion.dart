// Clase base para representar operaciones matemáticas con dos operandos

class Operacion {
  double operando1 = 0;
  double operando2 = 0;
  Operacion(this.operando1, this.operando2);

  double calcular() {
    return 0; // Este método debe ser implementado por las clases hijas
  }
}