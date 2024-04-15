

import 'package:ej4_creador_personajes/Clases/clasesbuilder.dart';
import 'package:ej4_creador_personajes/Razas/PersonajeBuilder.dart';

class HumanoBuilder extends PersonajeBuilder{
  static String RAZA = "humano";

  HumanoBuilder(ClaseBuilder claseBuilder) : super(claseBuilder){
    raza = RAZA;
  }

}

class ElfoBuilder extends PersonajeBuilder{
  static String RAZA = "elfo";

  ElfoBuilder(ClaseBuilder claseBuilder) : super(claseBuilder){
    raza = RAZA;
  }

}

class EnanoBuilder extends PersonajeBuilder{
  static String RAZA = "enano";

  EnanoBuilder(ClaseBuilder claseBuilder) : super(claseBuilder){
    raza = RAZA;
  }

}

class OrcoBuilder extends PersonajeBuilder{
  static String RAZA = "orco";

  OrcoBuilder(ClaseBuilder claseBuilder) : super(claseBuilder){
    raza = RAZA;
  }

}

