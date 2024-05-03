
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

  //Ordenar Lista

  void ordenarPorNombre(bool desc){
    if (desc){
      personajes.sort((a, b) => a.nombre.compareTo(b.nombre));
    } else{
      personajes.sort((a, b) => b.nombre.compareTo(a.nombre));
    }

  }

  void ordenarPorAtributo(bool desc, String atributo){
    if (desc){
      personajes.sort((a, b) => a.secondaryAttr[atributo]!.compareTo(b.secondaryAttr[atributo]!));
    } else{
      personajes.sort((a, b) => b.secondaryAttr[atributo]!.compareTo(a.secondaryAttr[atributo]!));
    }
  }

  List<Personaje> filtrarPorRaza(String filtroRaza){
    return personajes.where((p) => p.raza == filtroRaza).toList();
  }

  List<Personaje> filtrarPorClase(String filtroClase){
    return personajes.where((p) => p.clase == filtroClase).toList();
  }

}