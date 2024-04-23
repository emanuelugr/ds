
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

}