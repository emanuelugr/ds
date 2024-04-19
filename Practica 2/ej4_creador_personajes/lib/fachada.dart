
import 'package:ej4_creador_personajes/Razas/Personaje.dart';
import 'package:ej4_creador_personajes/Razas/PersonajeBuilder.dart';
import 'package:ej4_creador_personajes/Razas/director.dart';

class Fachada{
  static Fachada? instancia;      // Variable inicializada como nula

  //Antes, main y Menu era la forma visual del programa
  //Ahora lo que hagamos en main debera de llamar a la fachada para hacer las cosas

  late Director director;

  // Constructor privado para evitar la creación de instancias fuera de la clase
  Fachada._();

  // Método estático para obtener la instancia única de la clase Fachada
  static Fachada getInstancia() {
    // Si la instancia aún no ha sido inicializada, la creamos
    instancia ??= Fachada._();
    return instancia!;
  }

  //En main se determinara que personaje (Clase y Raza) se va a construir, y se lo pasamos

  void crearPersonaje(PersonajeBuilder personajeBuilder, String nombre){
    director = Director(personajeBuilder);
    director.crearPersonaje(nombre);
  }

  Personaje getProducto(){
    return director.getPersonaje();
  }
  //Para obtener los valores, o bien hacemos un textfield y metemos ahi todos los valores
  //O tenemos un textfield por atributo, y hacemos una funcion para ir sacandolos uno a uno

}