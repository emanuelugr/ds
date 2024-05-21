import 'package:ej4_creador_personajes/Razas/Personaje.dart';
import 'package:ej4_creador_personajes/Razas/PersonajeBuilder.dart';
import 'package:ej4_creador_personajes/Razas/director.dart';

class Fachada {
  static Fachada? instancia; // Variable inicializada como nula
  late Director director;

  // Constructor privado para evitar la creación de instancias fuera de la clase
  Fachada._();

  // Método estático para obtener la instancia única de la clase Fachada
  static Fachada getInstancia() {
    // Si la instancia aún no ha sido inicializada, la creamos
    instancia ??= Fachada._();
    return instancia!;
  }

  //En main se determinara que personaje (Clase y Raza) se va a construir y se lo pasamos
  Personaje crearPersonaje(
      PersonajeBuilder personajeBuilder, String nombre, String usuario) {
    director = Director(personajeBuilder);
    director.crearPersonaje(nombre, usuario);
    return director.getPersonaje();
  }
}
