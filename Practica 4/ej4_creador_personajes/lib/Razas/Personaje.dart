import 'dart:collection';
import 'dart:io';

class Personaje {
  late String nombre, raza, clase, usuario;
  int id = -1;

  late HashMap<String, double> primaryAttr;
  late HashMap<String, double> secondaryAttr;

  Personaje(); //Dart no permite multiples constructores /overload

  //Estos constructores son como "de copia", y asi podemos tener varios constructores
  Personaje.hash(Personaje otro) {
    primaryAttr = HashMap();
    secondaryAttr = HashMap();
  }

  Personaje.nombre(Personaje otro, String nom) {
    nombre = nom;
    raza = "";
    clase = "";
    usuario = "";
  }

  HashMap<String, double> GetPrimary() {
    return primaryAttr;
  }

  HashMap<String, double> GetSecondary() {
    return secondaryAttr;
  }

  void SetPrimaryAttributes(HashMap<String, double> attr) {
    primaryAttr = attr;
  }

  void SetSecondaryAttributes(HashMap<String, double> attr) {
    secondaryAttr = attr;
  }

  void SetName(String nombre) {
    this.nombre = nombre;
  }

  void SetUsuario(String usuario) {
    this.usuario = usuario;
  }

  void SetClass(String clase) {
    this.clase = clase;
  }

  void SetRace(String raza) {
    this.raza = raza;
  }

  void SetId(int id) {
    this.id = id;
  }

  void ExportState(String path) {
    // Abrir el archivo en modo escritura
    File file = File(path);
    IOSink sink = file.openWrite(mode: FileMode.write);

    // Vuelco las parejas key:value de atributos primarios
    primaryAttr.forEach((key, value) {
      sink.write('$key:$value\n');
    });

    // Vuelco las parejas key:value de atributos secundarios
    secondaryAttr.forEach((key, value) {
      sink.write('$key:$value\n');
    });

    // Cerrar el archivo
    sink.close();
  }

  factory Personaje.fromJson(Map<String, dynamic> json) {
    Personaje personaje = Personaje();
    personaje.SetId(json['id'] as int);
    personaje.SetUsuario(json['usuario'] as String);
    personaje.SetName(json['nombre'] as String);
    personaje.SetRace(json['raza'] as String);
    personaje.SetClass(json['clase'] as String);
    personaje.SetPrimaryAttributes(
        HashMap<String, double>.from(json['primAttr']));
    personaje.SetSecondaryAttributes(
        HashMap<String, double>.from(json['secAttr']));
    return personaje;
  }

  Map<String, dynamic> toJson() {
    return {
      if (this.id != -1) 'id': id,
      'nombre': nombre,
      'raza': raza,
      'clase': clase,
      'primAttr': primaryAttr,
      'secAttr': secondaryAttr,
      'usuario': usuario
    };
  }
}
