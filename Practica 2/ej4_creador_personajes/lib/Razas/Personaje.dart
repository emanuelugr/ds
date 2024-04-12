
import 'dart:collection';

class Personaje{
  late String nombre, raza, clase;

  late HashMap<String, int> primaryAttr;
  late HashMap<String, int> secondaryAttr;

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

  HashMap<String, int> GetPrimary() {
    return primaryAttr;
  }

  HashMap<String, int> GetSecondary() {
    return secondaryAttr;
  }

  void SetPrimaryAttributes(HashMap<String, int> attr){
    primaryAttr = attr;
  }

  void SetSecondaryAttributes(HashMap<String, int> attr){
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