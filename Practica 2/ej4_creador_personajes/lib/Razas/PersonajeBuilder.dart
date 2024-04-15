
import 'dart:collection';
import 'dart:io';
import 'dart:convert';

import 'package:ej4_creador_personajes/Razas/Personaje.dart';
import 'package:ej4_creador_personajes/Clases/clasesbuilder.dart';

abstract class PersonajeBuilder{
  late Personaje personaje;
  late ClaseBuilder claseBuilder;
  static String CFG_PATH = "package:ej4_creador_personajes/cfg";
  late String raza;  

  PersonajeBuilder(ClaseBuilder claseBuilder){
    this.claseBuilder = claseBuilder;
    personaje = Personaje();
  }

  HashMap<String, int> LoadCFG(){
    HashMap<String, int> temp = HashMap<String, int>();

/*  Por hacer
    Supuestamente esta implementacion permite obtener cada linea del fichero

    File(ClaseBuilder.CFG_PATH + clase + ".txt")
      .openRead()
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .forEach((l) => print('line: $l')); //Obtener info aqui creo
*/    
    return temp;
  }

  void crearPersonaje(){
    crearAtributos();
  }

  void crearAtributos(){
    crearPrimarios();
    crearSecundarios();
    personaje.SetClass(claseBuilder.getClassName());
    personaje.SetRace(raza);
  }

  void crearPrimarios(){
    var attr = LoadCFG();
    personaje.SetPrimaryAttributes(attr);
  }

  void crearSecundarios(){
    claseBuilder.crearClase(personaje.GetPrimary());
    personaje.SetSecondaryAttributes(claseBuilder.getClase());
  }

  Personaje getPersonaje(){
    return personaje;
  }

}