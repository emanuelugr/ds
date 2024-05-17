
import 'package:ej4_creador_personajes/Razas/Personaje.dart';

class GestorPersonajes{
  static GestorPersonajes? instancia;
  List<Personaje> personajes = [];

  GestorPersonajes._();

  static GestorPersonajes getInstancia() {
    instancia ??= GestorPersonajes._();
    return instancia!;
  }

  void addPersonaje(Personaje p){
    personajes.add(p);
  }

  int getLength(){
    return personajes.length;
  }

  Personaje getPersonaje(int id){
    if (id >= 0 && id < personajes.length) {
      return personajes[id];
    }else{
      throw "Id incorrecto";
    } 
  }

  void remPersonaje(int id){
    if (id >= 0 && id < personajes.length) {
      personajes.removeAt(id);
    }else{
      throw "Id incorrecto";
    } 
  }

  //Ordenar el personaje según su tipo
  void ordenarPersonaje(bool ascen, String tipo, [String atributo = ""]) {
    List<Personaje> copiaPersonajes = List.from(personajes);

    switch(tipo){
      case "nombre":
        if (ascen) {
          copiaPersonajes.sort((a, b) => a.nombre.compareTo(b.nombre));
        } else {
          copiaPersonajes.sort((a, b) => b.nombre.compareTo(a.nombre));
        }
        break;
      case "raza":
        if (ascen) {
          copiaPersonajes.sort((a, b) => a.raza.compareTo(b.raza));
        } else {
          copiaPersonajes.sort((a, b) => b.raza.compareTo(a.raza));
        }
        break;
      case "clase":
        if (ascen) {
          copiaPersonajes.sort((a, b) => a.clase.compareTo(b.clase));
        } else {
          copiaPersonajes.sort((a, b) => b.clase.compareTo(a.clase));
        }
        break;
      case "atributo":
        if (ascen) {
          copiaPersonajes.sort((a, b) => a.secondaryAttr[atributo]!.compareTo(b.secondaryAttr[atributo]!));
        } else {
          copiaPersonajes.sort((a, b) => b.secondaryAttr[atributo]!.compareTo(a.secondaryAttr[atributo]!));
        }
        break;
    }

    personajes = copiaPersonajes;
  }

  List<Personaje> filtrarPorRaza(String filtroRaza){
    List<Personaje> copiaPersonajes = List.from(personajes); 

    return copiaPersonajes.where((p) => p.raza == filtroRaza).toList();
  }

  List<Personaje> filtrarPorClase(String filtroClase){
    List<Personaje> copiaPersonajes = List.from(personajes); 

    return copiaPersonajes.where((p) => p.clase == filtroClase).toList();
  }

}