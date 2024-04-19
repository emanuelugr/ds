
import 'dart:collection';
import 'dart:io';
import 'dart:convert';

import 'package:ej4_creador_personajes/Razas/Personaje.dart';
import 'package:ej4_creador_personajes/Clases/clasesbuilder.dart';

abstract class PersonajeBuilder{
  late Personaje personaje;
  late ClaseBuilder claseBuilder;
  static String CFG_PATH = '../../cfg';
  late String raza;  

  PersonajeBuilder(ClaseBuilder claseBuilder){
    this.claseBuilder = claseBuilder;
    personaje = Personaje();
  }

  HashMap<String, double> loadCFG() {
    HashMap<String, double> temp = HashMap<String, double>();

    // Obtener la ruta del archivo de configuración correspondiente a la clase
    String cfgFilePath = '${ClaseBuilder.CFG_PATH}/raza/$raza.txt';
    // Verificar si el archivo existe
    File cfgFile = File(cfgFilePath);
    if (!cfgFile.existsSync()) {
      print("El archivo de configuración $cfgFilePath no existe.");
      return temp;
    }

    // Leer el archivo de configuración línea por línea
    List<String> lines = cfgFile.readAsLinesSync();
    for (String line in lines) {
      List<String> parts = line.split(':');
      if (parts.length == 2) {
        String attributeName = parts[0].trim();
        double attributeValue = double.tryParse(parts[1].trim()) ?? 0;  // Manejar posibles errores de conversión
        temp[attributeName] = attributeValue;
      }
    }

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
    var attr = loadCFG();
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