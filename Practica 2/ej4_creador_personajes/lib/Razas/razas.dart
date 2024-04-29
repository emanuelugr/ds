

import 'package:ej4_creador_personajes/Clases/clasesbuilder.dart';
import 'package:ej4_creador_personajes/Razas/PersonajeBuilder.dart';

class HumanoBuilder extends PersonajeBuilder{
  static String RAZA = "Humano";

  HumanoBuilder(ClaseBuilder claseBuilder) : super(claseBuilder){
    raza = RAZA;
  }

}

class ElfoBuilder extends PersonajeBuilder{
  static String RAZA = "Elfo";

  ElfoBuilder(ClaseBuilder claseBuilder) : super(claseBuilder){
    raza = RAZA;
  }

}

class EnanoBuilder extends PersonajeBuilder{
  static String RAZA = "Enano";

  EnanoBuilder(ClaseBuilder claseBuilder) : super(claseBuilder){
    raza = RAZA;
  }

}

class OrcoBuilder extends PersonajeBuilder{
  static String RAZA = "Orco";

  OrcoBuilder(ClaseBuilder claseBuilder) : super(claseBuilder){
    raza = RAZA;
  }

}

