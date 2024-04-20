
import 'dart:collection';
import 'dart:io';

abstract class ClaseBuilder{
  late HashMap<String, double> secundarios;
  late HashMap<String, double> primarios;

  double multiplier = 0.0;
  static String CFG_PATH = 'C:/Users/HP/Desktop/DS/DSpracticas/ds/Practica\ 2/ej4_creador_personajes/lib/cfg';
  String clase = "null";

  ClaseBuilder(){
    secundarios = HashMap<String, double>();
  }

  HashMap<String, double> loadCFG() {
    HashMap<String, double> temp = HashMap<String, double>();

    // Obtener la ruta del archivo de configuración correspondiente a la clase
    String cfgFilePath = '${CFG_PATH}/clase/${clase}.txt';
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

  String getClassName(){
    return clase;
  }

  void crearClase(HashMap<String, double> primaryAttr){

    var info = loadCFG();

    // Establecer los atributos secundarios que se obtienen directamente de los atributos primarios
    secundarios["Vida"] = primaryAttr["Resistencia"]! + primaryAttr["Fuerza"]!;
    secundarios["Estamina"] = primaryAttr["Destreza"]! + primaryAttr["Resistencia"]!;
    secundarios["Mana"] = primaryAttr["Inteligencia"]! + primaryAttr["Sabiduria"]!;
    secundarios["Persuasion"] = primaryAttr["Carisma"]! + primaryAttr["Sabiduria"]!;
    secundarios["Agilidad"] = primaryAttr["Destreza"]! + primaryAttr["Inteligencia"]!;
    secundarios["Intimidacion"] = primaryAttr["Fuerza"]! + primaryAttr["Carisma"]!;
    secundarios["Critico"] = primaryAttr["Percepcion"]! + primaryAttr["Inteligencia"]!;
    secundarios["Punteria"] = primaryAttr["Destreza"]! + primaryAttr["Percepcion"]!;

    // Aplicar multiplicadores de los atributos secundarios adicionales del archivo de configuración
    info.forEach((key, value) {
      if (secundarios.containsKey(key)) {
        secundarios.update(key, (valor) => ((valor * value)));
      }
    });
  }

  HashMap<String, double> getClase(){
    return secundarios;
  }
}
