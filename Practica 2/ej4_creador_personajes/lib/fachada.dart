import 'package:ej4_creador_personajes/Clases/clases.dart';
import 'package:ej4_creador_personajes/Clases/clasesbuilder.dart';
import 'package:ej4_creador_personajes/Razas/Personaje.dart';
import 'package:ej4_creador_personajes/Razas/PersonajeBuilder.dart';
import 'package:ej4_creador_personajes/Razas/director.dart';
import 'package:ej4_creador_personajes/Razas/razas.dart';

class Fachada {
  static Fachada? instancia; // Variable inicializada como nula
  late Director director;
  List<Personaje> personajes = [];

  // Constructor privado para evitar la creación de instancias fuera de la clase
  Fachada._() {
    test();
  }

  void test() {
    var d = Director(ElfoBuilder(CaballeroBuilder()));
    d.crearPersonaje("Elfo Caballero");
    var temp = d.getPersonaje();
    personajes.add(temp);

    d = Director(HumanoBuilder(MagoBuilder()));
    d.crearPersonaje("Humano Mago");
    temp = d.getPersonaje();
    personajes.add(temp);

    d = Director(OrcoBuilder(LadronBuilder()));
    d.crearPersonaje("Orco Bailarina");
    temp = d.getPersonaje();
    personajes.add(temp);
  }

  // Método estático para obtener la instancia única de la clase Fachada
  static Fachada getInstancia() {
    // Si la instancia aún no ha sido inicializada, la creamos
    instancia ??= Fachada._();
    return instancia!;
  }

  //En main se determinara que personaje (Clase y Raza) se va a construir y se lo pasamos
  void crearPersonaje(PersonajeBuilder personajeBuilder, String nombre) {
    director = Director(personajeBuilder);
    director.crearPersonaje(nombre);
    personajes.add(director.getPersonaje());
  }

//Control de errores debe pasar en el lado del codigo cliente? Revisar
  Personaje getProductoLast() {
    if (personajes.length > 0) {
      return personajes[personajes.length - 1];
    } else {
      throw "Lista vacia";
    }
  }

  int numPersonanjes() {
    return personajes.length;
  }

  Personaje getProductoById(int id) {
    if (id >= 0 && id < personajes.length) {
      return personajes[id];
    } else {
      throw "Id incorrecto";
    }
  }
}
