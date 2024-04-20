
import 'package:ej4_creador_personajes/Razas/Personaje.dart';
import 'package:ej4_creador_personajes/Razas/PersonajeBuilder.dart';

class Director{
  late Personaje personaje;
  late PersonajeBuilder personajeBuilder;

  Director(PersonajeBuilder personajeBuilder){
    this.personajeBuilder = personajeBuilder;
  }

  void crearPersonaje(String nombre){
    personajeBuilder.crearPersonaje();
    personaje = personajeBuilder.getPersonaje();
    personaje.SetName(nombre);
  }

  Personaje getPersonaje(){
    return personaje;
  }

}