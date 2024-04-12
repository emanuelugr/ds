
import 'dart:collection';
import 'dart:io';
import 'dart:convert';

abstract class ClaseBuilder{
  late HashMap<String, int> secundarios;
  late HashMap<String, int> primarios;

  double multiplier = 0.0;
  static String CFG_PATH = "package:ej4_creador_personajes/cfg";
  String clase = "null";

  ClaseBuilder(){
    secundarios = HashMap<String, int>();
  }

  HashMap<String, double> LoadCFG(){
    HashMap<String, double> temp = HashMap<String, double>();

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

  String getClassName(){
    return clase;
  }

  void crearClase(HashMap<String, int> primaryAttr){

    var info = LoadCFG();
    secundarios.update("Vida", (valor) => (primaryAttr["Resistencia"]! + primaryAttr["Fuerza"]!));
    secundarios.update("Estamina", (valor) => (primaryAttr["Destreza"]! + primaryAttr["Resistencia"]!));
    secundarios.update("Mana", (valor) => (primaryAttr["Inteligencia"]! + primaryAttr["Sabiduria"]!));
    secundarios.update("Persuasion", (valor) => (primaryAttr["Carisma"]! + primaryAttr["Sabiduria"]!));
    secundarios.update("Agilidad", (valor) => (primaryAttr["Destreza"]! + primaryAttr["Inteligencia"]!));
    secundarios.update("Intimidacion", (valor) => (primaryAttr["Fuerza"]! + primaryAttr["Carisma"]!));
    secundarios.update("Critico", (valor) => (primaryAttr["Percepcion"]! + primaryAttr["Inteligencia"]!));
    secundarios.update("Punteria", (valor) => (primaryAttr["Destreza"]! + primaryAttr["Percepcion"]!));
  
    info.forEach((key, value) {
      var oldvalue = secundarios[key];
      var mult = value;
      secundarios.update(key, (valor) => ((oldvalue! * mult).toInt()));
    });
  }

  HashMap<String, int> getClase(){
    return secundarios;
  }
}
