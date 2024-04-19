
import 'dart:collection';

class Personaje{
  late String nombre, raza, clase;

  late HashMap<String, double> primaryAttr;
  late HashMap<String, double> secondaryAttr;

  Personaje();  //Dart no permite multiples constructores /overload

  //Estos constructores son como "de copia", y asi podemos tener varios constructores
  Personaje.hash(Personaje otro){
    primaryAttr = HashMap();
    secondaryAttr = HashMap();
  }

  Personaje.nombre(Personaje otro, String nom){
    nombre = nom;
    raza = "";
    clase = "";
  }

  HashMap<String, double> GetPrimary() {
    return primaryAttr;
  }

  HashMap<String, double> GetSecondary() {
    return secondaryAttr;
  }

  void SetPrimaryAttributes(HashMap<String, double> attr){
    primaryAttr = attr;
  }

  void SetSecondaryAttributes(HashMap<String, double> attr){
    secondaryAttr = attr;
  }

  //No he introducido mostrarPersonaje ya que para esta no sirve

  void SetName(String nombre){
    this.nombre = nombre;
  }

  void SetClass(String clase){
    this.clase = clase;
  }

  void SetRace(String raza){
    this.raza = raza;
  }

}